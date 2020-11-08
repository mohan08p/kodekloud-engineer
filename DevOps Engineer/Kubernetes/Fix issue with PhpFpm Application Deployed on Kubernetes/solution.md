#### Fix issue with PhpFpm Application Deployed on Kubernetes

1. Use alias k as kubectl utility,

```
thor@jump_host ~$ alias k='kubectl'
```

2. Check the labels on pods, we can tag `app=nginx-fpm` is attached,

```
thor@jump_host /$ k get pods --show-labels
NAME                               READY   STATUS    RESTARTS   AGE     LABELS
nginx-phpfpm-dp-778fb84448-kvhh4   2/2     Running   0          7m30s   app=nginx-fpm,pod-template-hash=778fb84448,tier=frontend
```

3. Check the nginx service we can see the port is not default http port, hence change the port and targetPOrt to 80. Also, check tag used in there. We can see the config after updating port and tag,

```
thor@jump_host ~$ k get svc nginx-service -o yaml
apiVersion: v1
kind: Service
metadata:  
  annotations:
    kubectl.kubernetes.io/last-applied-configuration: |      
    {"apiVersion":"v1","kind":"Service","metadata":{"annotations":{},"labels":{"app":"nginx-fpm"},"name":"nginx-service","namespace":"default"},"spec":{"ports":[{"nodePort":30008,"port":8095}],"selector":{"app":"nginx-fpm","tier":"frontend"},"type":"LoadBalancer"}}  creationTimestamp: "2020-11-03T18:06:01Z"
  labels:    
    app: nginx-fpm
  name: nginx-service
  namespace: default
  resourceVersion: "1327"  selfLink: /api/v1/namespaces/default/services/nginx-service
  uid: 30088424-3507-48d6-9d37-6137ed690897
spec:
  clusterIP: 10.96.221.241
  externalTrafficPolicy: Cluster
  ports:
  - nodePort: 30008
    port: 80
    protocol: TCP
    targetPort: 80
  selector:
    app: nginx-fpm
    tier: frontend
  sessionAffinity: None
  type: LoadBalancer
status:
  loadBalancer: {}
```
  
4. Check the node IP address,

```  
thor@jump_host ~$ k get nodes -o wide
NAME           STATUS   ROLES    AGE   VERSION   INTERNAL-IP   EXTERNAL-IP   OS-IMAGE             KERNEL-VERSION       CONTAINER-RUNTIME
controlplane   Ready    master   12m   v1.16.4   172.17.0.8    <none>        Ubuntu 18.04.4 LTS   4.15.0-109-generic   docker://19.3.6
node01         Ready    <none>   11m   v1.16.0   172.17.0.9    <none>        Ubuntu 18.04.4 LTS   4.15.0-109-generic   docker://19.3.6
```

5. We can check the application on port 30008 from browser or using curl,

```
thor@jump_host ~$ curl 172.17.0.9:30008
<!DOCTYPE html>
<html>
<head><title>Welcome to nginx!</title>
<style>    
body {        width: 35em;        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;    }
</style>
</head>
<body><h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
```

Thank you.

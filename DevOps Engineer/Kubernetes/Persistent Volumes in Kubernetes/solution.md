#### Persistent Volumes in Kubernetes

1. Change directory to `/home/thor` on jump_host,

```
thor@jump_host ~$ cd /home/thor
```

2. First create a persistent volume and persistent volume claim manifest for manual storage,

```
thor@jump_host ~$ vi persistentvolume.yml
thor@jump_host ~$ vi persistentvolumeclaim.yml
```

3. Apply the manifest which will create a PV and PVC,

```
thor@jump_host ~$ kubectl create -f .
persistentvolume/pv-nautilus created
persistentvolumeclaim/pvc-nautilus created
```

4. Now create pod config,

```
thor@jump_host ~$ vi pod.yml
```

5. Create pod usign the kubectl which will monut a volume we created above,

```
thor@jump_host ~$ kubectl create -f pod.yml
pod/pod-nautilus created
```

6. Now, check the status of pod, pv and pvc respectively.

```
thor@jump_host ~$ kubectl get pv
NAME          CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS   CLAIM                  STORAGECLASS   REASON   AGE
pv-nautilus   8Gi        RWO            Retain           Bound    default/pvc-nautilus   manual                  17s

thor@jump_host ~$ kubectl get pvc
NAME           STATUS   VOLUME        CAPACITY   ACCESS MODES   STORAGECLASS   AGE
pvc-nautilus   Bound    pv-nautilus   8Gi        RWO            manual         22s

thor@jump_host ~$ kubectl get pods
NAME           READY   STATUS    RESTARTS   AGE
pod-nautilus   1/1     Running   0          30s
```

7. Now, exec into pod and check if you can able to access the default nginx page,

```
thor@jump_host ~$ kubectl exec -it pod-nautilus /bin/bashkubectl exec [POD] [COMMAND] is DEPRECATED and will be removed in a future version. Use kubectl kubectl exec [POD] -- [COMMAND] instead.

root@pod-nautilus:/# curl localhost
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
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

which validates that volumes monuted correctly and we are able to get a response from default page.

Thank you.

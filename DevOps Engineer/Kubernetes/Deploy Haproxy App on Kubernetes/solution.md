#### Deploy Haproxy App on Kubernetes

1. Change directory to `/home/thor` on jump box,

```
thor@jump_host /$ cd /home/thor/
```

2. Use alias k as kubectl,

```
thor@jump_host ~$ alias k='kubectl'
```

3. Create a namespace named `haproxy-controller-datacenter`,

```
thor@jump_host ~$ k create ns haproxy-controller-datacenter
namespace/haproxy-controller-datacenter created
```

4. Now, create a service account named, `haproxy-service-account-datacenter` in namespnace haproxy-controller-datacenter,

```
thor@jump_host ~$ k create sa haproxy-service-account-datacenter -n haproxy-controller-datacenter
serviceaccount/haproxy-service-account-datacenter created
```

5. Create a file, `cr.yaml` for writing clusterrole and clusterrolebinding config,

```
thor@jump_host ~$ vi cr.yaml
```

6. Now, create a clusterrole and clusterrolebinding respectively, 

```
thor@jump_host ~$ k create -f cr.yaml
clusterrole.rbac.authorization.k8s.io/haproxy-cluster-role-datacenter created
clusterrolebinding.rbac.authorization.k8s.io/haproxy-cluster-role-binding-datacenter created
```

7. Create a new file named `backend-deploy` for writing deployment and service manifest,

```
thor@jump_host ~$ vi backend-deploy.yaml
```

8. Now, create a deployment and service,

```
thor@jump_host ~$ k create -f backend-deploy.yaml
deployment.apps/backend-deployment-datacenter created
service/service-backend-datacenter created
```

9. Create a new file for haproxy deployment and service respectively,

```
thor@jump_host ~$ vi haproxy-deploy.yaml
```

10. Now, create a deployment and service,

```
thor@jump_host ~$ k create -f haproxy-deploy.yaml
deployment.apps/haproxy-ingress-datacenter created
service/ingress-service-datacenter created
```

11. Check hte pod, deployment and services status,

```
thor@jump_host ~$ k get po -n haproxy-controller-datacenter
NAME                                            READY   STATUS    RESTARTS   AGE
backend-deployment-datacenter-66854f748-l8wf7   1/1     Running   0          6m8s
haproxy-ingress-datacenter-74667ffd5f-nntzp     1/1     Running   0          4m25s

thor@jump_host ~$ k get deploy -n haproxy-controller-datacenter
NAME                            READY   UP-TO-DATE   AVAILABLE   AGE
backend-deployment-datacenter   1/1     1            1           6m16s
haproxy-ingress-datacenter      1/1     1            1           4m33s

thor@jump_host ~$ k get svc -n haproxy-controller-datacenter
NAME                         TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)                                     AGE
ingress-service-datacenter   NodePort    10.107.85.49     <none>        80:32456/TCP,443:32567/TCP,1024:32678/TCP   4m45s
service-backend-datacenter   ClusterIP   10.107.253.225   <none>        8080/TCP                                    6m28s
```

12. Now, we can access the aaplication on node port, 32456, 32567 and we can see response as default backend - 404,
Also, we can check from jump host on node ip as shown below,

```
thor@jump_host ~$ curl 172.17.0.41:32456
default backend - 404
thor@jump_host ~$ curl 172.17.0.41:32567
default backend - 404
```

13. Also, check the stats on port 32678 and we can see see frontend and backend respectively as well instances are in MAINT(maintaince) status,

![HAProxy Stats Dashboard](/images/HaproxyStats.JPG)

Thank you.

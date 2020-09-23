#### Deploy Jenkins on Kubernetes

1. Change directory to `/home/thor` on jump server,

```
thor@jump_host /$ cd /home/thor/
```

2. First, create a namespace name `jenkins` using manifest ot kubectl utility,

```
thor@jump_host ~$ vi namespace.yml
```
*NOTE: Refer current directoy for manifest  configuration files*

3. Create a namespace using kubectl utility,

```
thor@jump_host ~$ kubectl create -f namepsace.yml
namespace/jenkins created
```

4. Check all namespaces on the system,

```
thor@jump_host ~$ kubectl get ns
NAME              STATUS   AGE
default           Active   3h36m
jenkins           Active   11s
kube-node-lease   Active   3h36m
kube-public       Active   3h36m
kube-system       Active   3h36m
```

5. Now create a deployment configuration file,

```
thor@jump_host ~$ vi deployment.yml
```

6. Apply the deployment manifest file,

```
thor@jump_host ~$ kubectl create -f deployment.yml
deployment.apps/jenkins-deployment created
```

7. Check the deployment status,

```
thor@jump_host ~$ kubectl get deployments -n jenkins
NAME                 READY   UP-TO-DATE   AVAILABLE   AGE
jenkins-deployment   1/1     1            1           1m4s
```

8. Finally, expose a service using `NodePort`,

```
thor@jump_host ~$ vi service.yml
```

9. Apply the service configuration, 

```
thor@jump_host ~$ kubectl create -f service.yml
service/jenkins-service created
```

10. Get the services status,

```
thor@jump_host ~$ kubectl get svc
NAME         TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP   51m

thor@jump_host ~$ kubectl get svc -n jenkins
NAME              TYPE       CLUSTER-IP    EXTERNAL-IP   PORT(S)          AGE
jenkins-service   NodePort   10.99.96.43   <none>        8080:30008/TCP   14s
```

11. Now, you can access the Jenkins UI on port 30008. Click on + ahead of terminal and choose `Select Port to view on Host 1` and enter port as mentioend i.e. 30008 and click on Display Port, you should see as below,

![Jenkins Service](/images/jenkinsk8sDeploy.JPG)

Thank you.


#### Deploy Node App on Kubernetes

1. Change directory to `/home/thor` on jump server,

```
thor@jump_host /$ cd /home/thor/
```

2. Use alias k as kubectl utility,

```
thor@jump_host ~$ alias k='kubectl'
```

3. First, create a namespace named, `node-namespace-nautilus`,

```
thor@jump_host ~$ k create ns node-namespace-nautilus
namespace/node-namespace-nautilus created
```

4. Create a file node-app.yaml for writing a deployment and service manifest,

```
thor@jump_host ~$ vi node-app.yaml
```
*Note: Refer same directory for config*

5. Create a deployment and service respectively,

```
thor@jump_host ~$ k create -f node-app.yaml
deployment.apps/node-deployment-nautilus created
service/node-service-nautilus created
```

6. Check the pod, deployment status,

```
thor@jump_host ~$ k get pods -n node-namespace-nautilus
NAME                                        READY   STATUS    RESTARTS   AGE
node-deployment-nautilus-6f4ff4f975-qmckl   1/1     Running   0          41s
node-deployment-nautilus-6f4ff4f975-swrrz   1/1     Running   0          41s

thor@jump_host ~$ k get deploy -n node-namespace-nautilu
NAME                       READY   UP-TO-DATE   AVAILABLE   AGE
node-deployment-nautilus   2/2     2            2           69s

thor@jump_host ~$ k get svc -n node-namespace-nautilus
NAME                    TYPE       CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
node-service-nautilus   NodePort   10.102.243.33   <none>        80:30012/TCP   74s
```

7. Finally, access the application on port 31181 as shown below,

![Node Application](/images/nodeApp.JPG)

Thank you.


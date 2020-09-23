#### Rollback a Deployment in Kubernetes

1. We need to rollback the deployment to the previous version. First, check the deployment status if it's successfully rolled out or failed,

```
thor@jump_host /$ kubectl rollout status deployment nginx-deployment
deployment "nginx-deployment" successfully rolled out
```

2. As successfully rolled out, we can check the history,

```
thor@jump_host /$ kubectl rollout history deployment nginx-deployment
deployment.apps/nginx-deployment
REVISION  CHANGE-CAUSE
1         <none>
2         kubectl set image deployment nginx-deployment nginx-container=nginx:alpine-perl --record=true
```

3. Here, we can see the rollout happened by using image as `image:alpine-perl`, also if you want to validate it, you can do using kubectl edit deployment and verify that image version,

```
thor@jump_host /$ kubectl  edit deployment nginx-deployment
Edit cancelled, no changes made.

- image:alpine-perl
```

4. Now, rolback to the previous version using undo command,

```
thor@jump_host /$ kubectl rollout undo deployment nginx-deployment
deployment.apps/nginx-deployment rolled back
```

5. Check the pods status, we can see pods are `Terminating` and new one `ContainerCreting`,

```
thor@jump_host /$ kubectl  get pods
NAME                                READY   STATUS              RESTARTS   AGE
nginx-deployment-5f7f57d56b-6h55t   1/1     Running             0          4s
nginx-deployment-5f7f57d56b-hggsx   0/1     ContainerCreating   0          0s
nginx-deployment-5f7f57d56b-nrlvt   1/1     Running             0          2s
nginx-deployment-7bdf8cc69c-fx85j   0/1     Terminating         0          2m59s
nginx-deployment-7bdf8cc69c-rcnkk   1/1     Terminating         0          3m1s
nginx-deployment-7bdf8cc69c-zglsm   1/1     Running             0          3m9s


thor@jump_host /$ kubectl get pods
NAME                                READY   STATUS    RESTARTS   AGE
nginx-deployment-5f7f57d56b-6h55t   1/1     Running   0          30s
nginx-deployment-5f7f57d56b-hggsx   1/1     Running   0          26s
nginx-deployment-5f7f57d56b-nrlvt   1/1     Running   0          28s
```

6. Check the deployment status,

```
thor@jump_host /$ kubectl get deployments
NAME               READY   UP-TO-DATE   AVAILABLE   AGE
nginx-deployment   3/3     3            3           3m54s
```

7. Check the rollout histroy again, we can see REVISION as 2 and 3 so the previous revision 1 is trasformed into revision 3, hence, we can see this way,

```
thor@jump_host /$ kubectl rollout history deployment nginx-deployment
deployment.apps/nginx-deployment
REVISION  CHANGE-CAUSE
2         kubectl set image deployment nginx-deployment nginx-container=nginx:alpine-perl --record=true
3         <none>
```

8. Finally, verify image after the rollback,

```
thor@jump_host /$ kubectl  edit deployment nginx-deployment
Edit cancelled, no changes made.

- image: nginx:1.16
```

Thank you.

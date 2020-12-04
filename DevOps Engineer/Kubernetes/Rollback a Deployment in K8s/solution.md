#### Rollback a Deployment in K8s

1. Change directory to `/home/thor` on jump box,

```
thor@jump_host /$ cd /home/thor/
```

2. Use alias k as kubectl,

```
thor@jump_host ~$ alias k='kubectl'
```

3. Check the deployment status, we can see no pod in ready state,

```
thor@jump_host ~$ k get deploy
NAME               READY   UP-TO-DATE   AVAILABLE   AGE
nginx-deployment   0/3     1            0           38s
```

4. Check hte deployment rollout status,

```
thor@jump_host ~$ k rollout status deploy nginx-deployment
deployment "nginx-deployment" successfully rolled out
```

5. Undo the deployment using `rollout undo` command,

```
thor@jump_host ~$ k rollout undo deploy nginx-deployment
deployment.apps/nginx-deployment rolled back
```

6. Check the rollout stauts again, rollout is happening in reverse order i.e. to the previous version of replicaset,

```
thor@jump_host ~$ k rollout status deploy nginx-deployment
Waiting for deployment "nginx-deployment" rollout to finish: 1 out of 3 new replicas have been updated...
Waiting for deployment "nginx-deployment" rollout to finish: 1 out of 3 new replicas have been updated...
Waiting for deployment "nginx-deployment" rollout to finish: 1 out of 3 new replicas have been updated...
Waiting for deployment "nginx-deployment" rollout to finish: 2 out of 3 new replicas have been updated...
Waiting for deployment "nginx-deployment" rollout to finish: 2 out of 3 new replicas have been updated...
Waiting for deployment "nginx-deployment" rollout to finish: 2 out of 3 new replicas have been updated...
Waiting for deployment "nginx-deployment" rollout to finish: 1 old replicas are pending termination...
Waiting for deployment "nginx-deployment" rollout to finish: 1 old replicas are pending termination...
deployment "nginx-deployment" successfully rolled out
```

7. Finall, we can check that all 3 replicas are in ready state,

```
thor@jump_host ~$ k get deploy
NAME               READY   UP-TO-DATE   AVAILABLE   AGE
nginx-deployment   3/3     3            3           3m21s
```

Thank you.

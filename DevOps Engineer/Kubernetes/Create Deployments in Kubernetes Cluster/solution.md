#### Create Deployments in Kubernetes Cluster

1. Change directory to `thor`,

```
thor@jump_host /$ cd /home/thor/
```

2. Create a `deployment.yml` manifest file,

```
thor@jump_host ~$ vi deployment.yml
```
*NOTE: Refer current directory for the deployment manifest*

3. Apply the configuration file using kubectl utility,

```
thor@jump_host ~$ kubectl create -f deployment.yml
deployment.apps/httpd created
```

4. Check the pod and deployment status respectively,

```
thor@jump_host ~$ kubectl get pods
NAME                    READY   STATUS              RESTARTS   AGE
httpd-d9654f449-w4xxn   0/1     ContainerCreating   0          6s
thor@jump_host ~$ kubectl get deploy
NAME    READY   UP-TO-DATE   AVAILABLE   AGE
httpd   0/1     1            0           11s
```

5. Verfi that it is running once the pods creation completed,

```
thor@jump_host ~$ kubectl get pods
NAME                    READY   STATUS    RESTARTS   AGE
httpd-d9654f449-w4xxn   1/1     Running   0          34s
thor@jump_host ~$ kubectl get deploy
NAME    READY   UP-TO-DATE   AVAILABLE   AGE
httpd   1/1     1            1           39s
```

Thank you.

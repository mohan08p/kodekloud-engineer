#### ReplicationController in Kubernetes

1. Change directory to `/home/thor` on jump server,

```
thor@jump_host /$ cd /home/thor/
```

2. Create a file `rc.yaml`, 

```
thor@jump_host ~$ vi rc.yaml
```

3. Use alias k as kubectl utility,

```
thor@jump_host ~$ alias k='kubectl'
```

4. Apply the Replication controller  manifest,

```
thor@jump_host ~$ k create -f rc.yaml
replicationcontroller/nginx-replicationcontroller created
```

5. Check the status,

```
thor@jump_host ~$ k get rc
NAME                          DESIRED   CURRENT   READY   AGE
nginx-replicationcontroller   3         3         0       5s


thor@jump_host ~$ k get rc
NAME                          DESIRED   CURRENT   READY   AGE
nginx-replicationcontroller   3         3         3       12s
```

6. Check if pods are running or not and the labels, respectively.

```
thor@jump_host ~$ k get pods
NAME                                READY   STATUS    RESTARTS   AGE
nginx-replicationcontroller-8hc2m   1/1     Running   0          22s
nginx-replicationcontroller-cz27k   1/1     Running   0          22s
nginx-replicationcontroller-lcq7d   1/1     Running   0          22s

thor@jump_host ~$ k get pods --show-labels
NAME                                READY   STATUS    RESTARTS   AGE   LABELS
nginx-replicationcontroller-8hc2m   1/1     Running   0          35s   app=nginx_app,type=front-end
nginx-replicationcontroller-cz27k   1/1     Running   0          35s   app=nginx_app,type=front-end
nginx-replicationcontroller-lcq7d   1/1     Running   0          35s   app=nginx_app,type=front-end
```

Thank you.

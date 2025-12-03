#### Deploy Highly Available Pods with ReplicationController

1. Create the `replication-controller.yaml` configuration file on the jump host,

```
thor@jumphost ~$ vi replication-controller.yaml
```

The content of the file is as below,

```
thor@jumphost ~$ cat replication-controller.yaml
apiVersion: v1
kind: ReplicationController
metadata:
  name: nginx-replicationcontroller
  labels:
    app: nginx_app
    type: front-end
spec:
  replicas: 3
  selector:
    app: nginx_app
  template:
    metadata:
      name: nginx
      labels:
        app: nginx_app
        type: front-end
    spec:
      containers:
      - name: nginx-container
        image: nginx
        ports:
        - containerPort: 80
```

2. Now, apply the configuration of the above file,

```
thor@jumphost ~$ k apply -f replication-controller.yaml
replicationcontroller/nginx-replicationcontroller created
```

3. Finally, verify the pods are up and running and replication controller showing healthy,

```
thor@jumphost ~$ k get po 
NAME                                READY   STATUS    RESTARTS   AGE
nginx-replicationcontroller-6bkx4   1/1     Running   0          15s
nginx-replicationcontroller-6lnq6   1/1     Running   0          15s
nginx-replicationcontroller-pk5kw   1/1     Running   0          15s

thor@jumphost ~$ k get rc
NAME                          DESIRED   CURRENT   READY   AGE
nginx-replicationcontroller   3         3         3       19s
```
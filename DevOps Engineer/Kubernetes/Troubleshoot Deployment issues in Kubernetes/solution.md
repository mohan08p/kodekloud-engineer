#### Troubleshoot Deployment issues in Kubernetes

1. Check the pod and deployment status on jump host node.

```
thor@jump_host /$ kubectl get pods
NAME                                READY   STATUS    RESTARTS   AGE
redis-deployment-68fdbcc88d-vmrns   0/1     Pending   0          2s

thor@jump_host /$ kubectl get deployments
NAME               READY   UP-TO-DATE   AVAILABLE   AGE
redis-deployment   0/1     1            0           33s
```

2. Now use `kubectl describe` to check the events of pod,

```
thor@jump_host /$ kubectl describe pod redis-deployment-68fdbcc88d-vmrns
Name:           redis-deployment-68fdbcc88d-vmrns
Namespace:      default
Priority:       0
Node:           <none>
Labels:         app=redis
                pod-template-hash=68fdbcc88d
Annotations:    <none>
Status:         Pending
IP:
IPs:            <none>
Controlled By:  ReplicaSet/redis-deployment-68fdbcc88d
Containers:
  redis-container:
...
...
...
QoS Class:       Burstable
Node-Selectors:  kubernetes.io/hostname=maste
Tolerations:     node-role.kubernetes.io/maste:NoSchedule
                 node.kubernetes.io/not-ready:NoExecute for 300s
                 node.kubernetes.io/unreachable:NoExecute for 300s
Events:
  Type     Reason            Age                From               Message
  ----     ------            ----               ----               -------
  Warning  FailedScheduling  85s (x2 over 86s)  default-scheduler  0/2 nodes are available: 2 node(s) didn't match node selector.
```

3. We can see in `Node-Selectors` section master spell incorrect, now edit the deployment,

```
thor@jump_host /$ kubectl edit deployment redis-deployment
deployment.apps/redis-deployment edited

And, check if the below parameters are correct,


nodeSelector:
  kubernetes.io/hostnamer: master
  
tolerations:
  - effect: NoSchedule
    key: node-role.kubernetes.io/master
	operator: Exists
  
redis:alpine

Configmap reference is to redis-config
```

4. Now, check the pod and deployment status accordingly,

```
thor@jump_host /$ kubectl get pods
NAME                                READY   STATUS              RESTARTS   AGE
redis-deployment-56ccf4d7bc-qwv6l   0/1     ContainerCreating   0          5s
redis-deployment-68fdbcc88d-vmrns   0/1     Pending             0          5m15s

thor@jump_host /$ kubectl get pods
NAME                                READY   STATUS    RESTARTS   AGE
redis-deployment-56ccf4d7bc-qwv6l   1/1     Running   0          13s

thor@jump_host /$ kubectl get deployments
NAME               READY   UP-TO-DATE   AVAILABLE   AGE
redis-deployment   1/1     1            1           5m31s
```

Thank you.

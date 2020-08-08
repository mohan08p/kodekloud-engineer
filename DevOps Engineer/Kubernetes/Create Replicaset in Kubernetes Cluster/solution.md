#### Create Replicaset in Kubernetes Cluster

1. Create a replica set mafiest named `httpd-replicaset.yaml` and describe as given in a question,

```
vi httpd-replicaset.yaml
```
NOTE: You can find the file in the the same directory.

2. Create a replica set object usign the following command, 

```
kubectl create -f httpd-replicaset.yaml
```

3. Now, check the status of pods initially we can see the pcontainers are in creating state,

```
thor@jump_host ~$ kubectl get po
NAME                     READY   STATUS              RESTARTS   AGE
httpd-replicaset-6dlvf   0/1     ContainerCreating   0          11s
httpd-replicaset-gzrct   0/1     ContainerCreating   0          12s
httpd-replicaset-mvltj   0/1     ContainerCreating   0          12s
httpd-replicaset-zcpq7   0/1     ContainerCreating   0          12s
```

4. Check the ReplicaSet status using the following command,

```
thor@jump_host ~$ kubectl get rs
NAME               DESIRED   CURRENT   READY   AGE
httpd-replicaset   4         4         0       22s
```
                                                                                   
5. Also, describe the ReplicaSet and see the the details for confirmation,
                                                      
```                          
thor@jump_host ~$ kubectl describe rs httpd-replicaset
Name:         httpd-replicaset
Namespace:    default
Selector:     type=front-end
Labels:       app=httpd_app
              type=front-end
Annotations:  <none>
Replicas:     4 current / 4 desired
Pods Status:  4 Running / 0 Waiting / 0 Succeeded / 0 Failed
Pod Template:
  Labels:  type=front-end
  Containers:
   httpd-container:
    Image:        httpd:latest
    Port:         <none>
    Host Port:    <none>
    Environment:  <none>
    Mounts:       <none>
  Volumes:        <none>
Events:
  Type    Reason            Age   From                   Message
  ----    ------            ----  ----                   -------
  Normal  SuccessfulCreate  51s   replicaset-controller  Created pod: httpd-replicaset-mvltj
  Normal  SuccessfulCreate  51s   replicaset-controller  Created pod: httpd-replicaset-zcpq7
  Normal  SuccessfulCreate  50s   replicaset-controller  Created pod: httpd-replicaset-gzrct
  Normal  SuccessfulCreate  50s   replicaset-controller  Created pod: httpd-replicaset-6dlvf
```

The screenshot for the describe is attached,

![Describe ReplicaSet](/images/DesReplicaSet.JPG)


Thank you.

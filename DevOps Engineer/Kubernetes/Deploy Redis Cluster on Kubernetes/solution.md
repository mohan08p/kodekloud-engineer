#### Deploy Redis Cluster on Kubernetes

1. Change directory to `/home/thor` on jump box,

```
thor@jump_host /$ cd /home/thor/
```

2. Use alias k as kubectl,

```
thor@jump_host ~$ alias k='kubectl'
```

3. Create a file `pv.yaml` for creating Persistent Volume,

```
thor@jump_host ~$ vi pv.yaml
```
*Note: Check current directory for the config*

4. Create a PV, 

```
thor@jump_host ~$ k create -f pv.yaml
persistentvolume/redis-pv-01 created
persistentvolume/redis-pv-02 created
persistentvolume/redis-pv-03 created
persistentvolume/redis-pv-04 created
persistentvolume/redis-pv-05 created
persistentvolume/redis-pv-06 created
```

5. Check PV status,

```
thor@jump_host ~$ k get pv
NAME          CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS      CLAIM   STORAGECLASS   REASON   AGE
redis-pv-01   1Gi        RWO            Retain           Available                                   10s
redis-pv-02   1Gi        RWO            Retain           Available                                   10s
redis-pv-03   1Gi        RWO            Retain           Available                                   10s
redis-pv-04   1Gi        RWO            Retain           Available                                   10s
redis-pv-05   1Gi        RWO            Retain           Available                                   10s
redis-pv-06   1Gi        RWO            Retain           Available                                   10s
```

6. Now, create a StatefulSet file named `sts.yaml`,

```
thor@jump_host ~$ vi sts.yaml
Note: Check current directory for the config

thor@jump_host ~$ k create -f sts.yaml
statefulset.apps/redis-cluster created
```

7. Check statefulset status,

```
thor@jump_host ~$ k get sts
NAME            READY   AGE
redis-cluster   0/6     4s

thor@jump_host ~$ k get sts
NAME            READY   AGE
redis-cluster   6/6     37s
```

8. Now, create a service file `svc.yaml`

```
thor@jump_host ~$ vi svc.yaml
Note: Check current directory for the config

thor@jump_host ~$ k create -f svc.yaml
service/redis-cluster-service created
```

9. Chekc the service status,

```
thor@jump_host ~$ k get svc
NAME                    TYPE        CLUSTER-IP    EXTERNAL-IP   PORT(S)              AGE
kubernetes              ClusterIP   10.96.0.1     <none>        443/TCP              8m8s
redis-cluster-service   ClusterIP   10.110.41.7   <none>        6379/TCP,16379/TCP   4s
```

10. Now, check the pv, pods and statefulset status, we can see pv are bound,

```
thor@jump_host ~$ k get pv
NAME          CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS   CLAIM                          STORAGECLASS   REASON   AGE
redis-pv-01   1Gi        RWO            Retain           Bound    default/data-redis-cluster-4                           10m
redis-pv-02   1Gi        RWO            Retain           Bound    default/data-redis-cluster-3                           10m
redis-pv-03   1Gi        RWO            Retain           Bound    default/data-redis-cluster-2                           10m
redis-pv-04   1Gi        RWO            Retain           Bound    default/data-redis-cluster-5                           10m
redis-pv-05   1Gi        RWO            Retain           Bound    default/data-redis-cluster-1                           10m
redis-pv-06   1Gi        RWO            Retain           Bound    default/data-redis-cluster-0                           10m

thor@jump_host ~$ k get sts
NAME            READY   AGE
redis-cluster   6/6     5m9s

thor@jump_host ~$ k get pods
NAME              READY   STATUS    RESTARTS   AGE
redis-cluster-0   1/1     Running   0          5m13s
redis-cluster-1   1/1     Running   0          5m3s
redis-cluster-2   1/1     Running   0          4m59s
redis-cluster-3   1/1     Running   0          4m56s
redis-cluster-4   1/1     Running   0          4m50s
redis-cluster-5   1/1     Running   0          4m43s
```

11. Now, configure the cluster using cluster create command, type yes when prompted,

```
thor@jump_host ~$  kubectl exec -it redis-cluster-0 -- redis-cli --cluster create --cluster-replicas 1 $(kubectl get pods -l app=redis-cluster -o jsonpath='{range.items[*]}{.status.podIP}:6379 {end}')
>>> Performing hash slots allocation on 6 nodes...Master[0] -> Slots 0 - 5460
Master[1] -> Slots 5461 - 10922Master[2] -> Slots 10923 - 16383
Adding replica 10.44.0.4:6379 to 10.44.0.1:6379Adding replica 10.44.0.5:6379 to 10.44.0.2:6379
Adding replica 10.44.0.6:6379 to 10.44.0.3:6379M: cd7d4988313dc7576f82aa7a574343c671925a27 10.44.0.1:6379
   slots:[0-5460] (5461 slots) masterM: 8e944bb2ad42fbf13990b2c68ed1651cd31c7e11 10.44.0.2:6379
   slots:[5461-10922] (5462 slots) masterM: 26ee42c429fe75aaccfb6bf8d55a7096eb30e76d 10.44.0.3:6379
   slots:[10923-16383] (5461 slots) masterS: 55ea0235945cdbfd575c05504d9b3c827223b416 10.44.0.4:6379
   replicates cd7d4988313dc7576f82aa7a574343c671925a27S: f91e0737e09e527aff72846b644b887c61ec5814 10.44.0.5:6379
   replicates 8e944bb2ad42fbf13990b2c68ed1651cd31c7e11
S: 50206922feb20561993caed5b787dcaba6ec58b2 10.44.0.6:6379
   replicates 26ee42c429fe75aaccfb6bf8d55a7096eb30e76d
Can I set the above configuration? (type 'yes' to accept): yes
>>> Nodes configuration updated
>>> Assign a different config epoch to each node
>>> Sending CLUSTER MEET messages to join the cluster
Waiting for the cluster to join
......
>>> Performing Cluster Check (using node 10.44.0.1:6379)
M: cd7d4988313dc7576f82aa7a574343c671925a27 10.44.0.1:6379
   slots:[0-5460] (5461 slots) master
   1 additional replica(s)
M: 26ee42c429fe75aaccfb6bf8d55a7096eb30e76d 10.44.0.3:6379
   slots:[10923-16383] (5461 slots) master
   1 additional replica(s)
S: f91e0737e09e527aff72846b644b887c61ec5814 10.44.0.5:6379
   slots: (0 slots) slave
   replicates 8e944bb2ad42fbf13990b2c68ed1651cd31c7e11
M: 8e944bb2ad42fbf13990b2c68ed1651cd31c7e11 10.44.0.2:6379
   slots:[5461-10922] (5462 slots) master
   1 additional replica(s)
S: 55ea0235945cdbfd575c05504d9b3c827223b416 10.44.0.4:6379
   slots: (0 slots) slave
   replicates cd7d4988313dc7576f82aa7a574343c671925a27
S: 50206922feb20561993caed5b787dcaba6ec58b2 10.44.0.6:6379
   slots: (0 slots) slave
   replicates 26ee42c429fe75aaccfb6bf8d55a7096eb30e76d
[OK] All nodes agree about slots configuration.
>>> Check for open slots...
>>> Check slots coverage...
[OK] All 16384 slots covered.
```

12. Finally, check the clsuter info to view the status and nodes of the cluster respectively,

```
thor@jump_host ~$ k exec -it redis-cluster-0 -- redis-cli cluster info
cluster_state:ok
cluster_slots_assigned:16384
cluster_slots_ok:16384
cluster_slots_pfail:0
cluster_slots_fail:0
cluster_known_nodes:6
cluster_size:3
cluster_current_epoch:6
cluster_my_epoch:1
cluster_stats_messages_ping_sent:92
cluster_stats_messages_pong_sent:95
cluster_stats_messages_sent:187
cluster_stats_messages_ping_received:90
cluster_stats_messages_pong_received:92
cluster_stats_messages_meet_received:5
cluster_stats_messages_received:187
```

Thank you.

#### Node Affinity in Kubernetes Cluster

1. Change directory to `/home/thor` on jump host,

```
thor@jump_host /$ cd /home/thor/
```

2. Create a kubectl alias as k,

```
thor@jump_host ~$ alias k='kubectl'
```

3. Check the number of nodes in k8s cluster,

```
thor@jump_host ~$ k get nodes
NAME     STATUS   ROLES    AGE     VERSION
master   Ready    master   4m51s   v1.16.4
node01   Ready    <none>   4m17s   v1.16.0
```

4. Now, as mnetioned in first step, assign label `color=black` to node01,

```
thor@jump_host ~$ k label node node01 color=black
node/node01 labeled
```

5. You can validate that the label is applied correctly,

```
thor@jump_host ~$ k get nodes node01 --show-labels
NAME     STATUS   ROLES    AGE     VERSION   LABELS
node01   Ready    <none>   4m47s   v1.16.0   beta.kubernetes.io/arch=amd64,beta.kubernetes.io/os=linux,**color=black**,kubernetes.io/arch=amd64,kubernetes.io/hostname=node01,kubernetes.io/os=linux
```

6. Now, create a file `nginx-deployment.yml`,

```
thor@jump_host ~$ vi nginx-deployment.yml
```
*Note: Check the current directory for the same*

7. Apply this manifest configuration,

```
thor@jump_host ~$ k create -f nginx-deployment.yml
deployment.apps/black created
```

8. Now the deployment and pods status, respectively.

```
thor@jump_host ~$ k get deploy
NAME    READY   UP-TO-DATE   AVAILABLE   AGE
black   1/3     3            1           6s

thor@jump_host ~$ k get pods
NAME                     READY   STATUS    RESTARTS   AGE
black-6dfc58b5dc-4cpmz   1/1     Running   0          9s
black-6dfc58b5dc-gskpm   1/1     Running   0          9s
black-6dfc58b5dc-q8wqb   1/1     Running   0          9s
```

9. Check on which nodes these pods are running using flag `-o wide`,

```
thor@jump_host ~$ k get pods -o wide
NAME                     READY   STATUS    RESTARTS   AGE   IP          NODE     NOMINATED NODE   READINESS GATES
black-6dfc58b5dc-4cpmz   1/1     Running   0          16s   10.44.0.2   node01   <none>           <none>black-6dfc58b5dc-gskpm   1/1     Running   0          16s   10.44.0.3   node01   <none>           <none>
black-6dfc58b5dc-q8wqb   1/1     Running   0          16s   10.44.0.1   node01   <none>           <none>
```

Thank you.

#### Create Pods in Kubernetes Cluster

1. Change directroy to `/home/thor` on jump host,

```
thor@jump_host /$ cd /home/thor/
```

2. Make a alias of `kubectl` as k,

```
thor@jump_host ~$ alias k='kubectl'
```

3. Here, we will do a different way rather than writing it from scratch, Will generate a manifest and update it slitely to meet our needs. 

```
thor@jump_host ~$ k run pod-nginx --image=nginx:latest --dry-run=client -o yaml > nginx-pod.yaml

thor@jump_host ~$ vi nginx-pod.yaml
```
*Note: After updating you can find it in the same directroy.*

4. Now, create a pod usign `kubectl create` utility,

```
hor@jump_host ~$ k create -f nginx-pod.yaml
pod/pod-nginx created
```

5. Check the pod and labels respectively, 

```
hor@jump_host ~$ k get pods
NAME        READY   STATUS              RESTARTS   AGE
pod-nginx   0/1     ContainerCreating   0          9s

thor@jump_host ~$ k get pods --show-labels
NAME        READY   STATUS    RESTARTS   AGE   LABELS
pod-nginx   1/1     Running   0          18s   app=nginx_app

thor@jump_host ~$ k get pods
NAME        READY   STATUS    RESTARTS   AGE
pod-nginx   1/1     Running   0          68s
```

6. Also, validate `container-name` using kubectl describe command,

```
thor@jump_host ~$ k describe pod pod-nginx
...
...
...	
Containers:
  nginx-container:
    Container ID:   docker://1127f15ddc74ef2898f69f6ff1d29dbbf09435dee0e9e64fa41280bfacd8ee9a
    Image:          nginx:latest
    Image ID:       docker-pullable://nginx@sha256:fc66cdef5ca33809823182c9c5d72ea86fd2cef7713cf3363e1a0b12a5d77500
    Port:           80/TCP
    Host Port:      0/TCP
    State:          Running
      Started:      Fri, 09 Oct 2020 14:58:28 +0000
...
...
...
```

Thank you.

#### Kubernetes Shared Volumes

1. Change directory to `/home/thor` on jump server,

```
thor@jump_host /$ cd /home/thor/
```

2. Use alias k as kubectl utility,

```
thor@jump_host ~$ alias k='kubectl'
```

3. Now, create a `pod.yaml` config,

```
thor@jump_host ~$ vi pod.yaml
```
*Note: Refer same directory for config*

4. Create a a pod,

```
thor@jump_host ~$ k create -f pod.yaml
pod/volume-share-xfusion created
```

5. Check the pod status,

```
thor@jump_host ~$ k get pods
NAME                   READY   STATUS              RESTARTS   AGE
volume-share-xfusion   0/2     ContainerCreating   0          6s

thor@jump_host ~$ k get pods
NAME                   READY   STATUS    RESTARTS   AGE
volume-share-xfusion   2/2     Running   0          15s
```

6. Now get a shell into `volume-container-xfusion-1` and create a blog.txt file as described in problem statement,

```
thor@jump_host ~$ k exec -it volume-share-xfusion -c volume-container-xfusion-1 /bin/bash
kubectl exec [POD] [COMMAND] is DEPRECATED and will be removed in a future version. Use kubectl kubectl exec [POD] -- [COMMAND] instead.

[root@volume-share-xfusion /]# cd /tmp/blog/

[root@volume-share-xfusion blog]# ls -ltr
total 0

[root@volume-share-xfusion blog]# echo "Welcome to xFusionCorp Industries!" > blog.txt

[root@volume-share-xfusion blog]# ls -ltr
total 4
-rw-r--r-- 1 root root 35 Oct 26 06:16 blog.txt

[root@volume-share-xfusion blog]# cat blog.txt
Welcome to xFusionCorp Industries!

[root@volume-share-xfusion blog]# exit
exit
```

7. Once you exit out of a container, now get a shell into `volume-container-xfusion-2` and check if you can see the blog.txt file is present or not!

```
thor@jump_host ~$ k exec -it volume-share-xfusion -c volume-container-xfusion-2 /bin/bash
kubectl exec [POD] [COMMAND] is DEPRECATED and will be removed in a future version. Use kubectl kubectl exec [POD] -- [COMMAND] instead.

[root@volume-share-xfusion /]# cd /tmp/games/

[root@volume-share-xfusion games]# ls -ltr
total 4
-rw-r--r-- 1 root root 35 Oct 26 06:16 blog.txt

[root@volume-share-xfusion games]# cat blog.txt
Welcome to xFusionCorp Industries!

[root@volume-share-xfusion games]#
```

Thank you.

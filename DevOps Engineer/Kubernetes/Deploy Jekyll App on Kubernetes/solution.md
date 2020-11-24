#### Deploy Jekyll App on Kubernetes

1. Change directory to `/home/thor` on jump server,

```
thor@jump_host /$ cd /home/thor/
```

2. Use alias k as kubectl utility,

```
thor@jump_host ~$ alias k='kubectl'
```

3. First, create a namespace named, `jekyll-namespace-devops`,

```
thor@jump_host ~$ k create ns jekyll-namespace-devops
namespace/jekyll-namespace-devops created
```

4. Check that the PV has already been created to use,

```
thor@jump_host ~$ k get pv
NAME                 CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS      CLAIM   STORAGECLASS   REASON   AGE
jekyll-site-devops   1Gi        RWX            Retain           Available                                   60s
```

5. Now, create PVC to claim the respective created PV,

```
thor@jump_host ~$ vi pvc.yaml
```
*Note: Refer same directory for config*

6. Apply the PVC config, also, we can see now that a PV status is bound,

```
thor@jump_host ~$ k create -f pvc.yaml
persistentvolumeclaim/jekyll-site-devops created

thor@jump_host ~$ k get pvc -n jekyll-namespace-devops
NAME                 STATUS   VOLUME               CAPACITY   ACCESS MODES   STORAGECLASS   AGE
jekyll-site-devops   Bound    jekyll-site-devops   1Gi        RWX                           7s

thor@jump_host ~$ k get pv
NAME                 CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS   CLAIM                                        STORAGECLASS   REASON   AGE
jekyll-site-devops   1Gi        RWX            Retain           Bound    jekyll-namespace-devops/jekyll-site-devops    4m32s
```

7. Now, create a Pod and Service as described in the problem statement,

```
thor@jump_host ~$ vi app.yaml
```
*Note: Refer same directory for config*

8. Apply the config respctively so a pod and a service will be created,

```
thor@jump_host ~$ k create -f app.yaml
pod/jekyll-pod-devops created
service/jekyll-container-devops created
```

9. Chekc the pod status, 

```
thor@jump_host ~$ k get pods -n jekyll-namespace-devops
NAME                READY   STATUS    RESTARTS   AGE
jekyll-pod-devops   1/1     Running   0          40s
```

10. Now, access the application on port 31181 as shown below,

![Jekyll Web Application](/images/JekyllApp.JPG) 

11. Finally exec into pod and check the mount path for the files,

```
thor@jump_host ~$ k exec -it jekyll-pod-devops /bin/bash -n jekyll-namespace-devops
kubectl exec [POD] [COMMAND] is DEPRECATED and will be removed in a future version. Use kubectl exec [POD] -- [COMMAND] instead.
bash-4.4#
bash-4.4# cd /site/
bash-4.4# ls -ltr
total 32
-rw-r--r--    1 root     root           175 Nov 24 03:20 index.md
-rw-r--r--    1 root     root           539 Nov 24 03:20 about.md
drwxr-xr-x    2 root     root          4096 Nov 24 03:20 _posts
-rw-r--r--    1 root     root          1652 Nov 24 03:20 _config.yml
-rw-r--r--    1 root     root          1039 Nov 24 03:20 Gemfile
-rw-r--r--    1 root     root           398 Nov 24 03:20 404.html
-rw-r--r--    1 root     root          1666 Nov 24 03:20 Gemfile.lock
drwxr-xr-x    5 root     root          4096 Nov 24 03:20 _site
```

Thank you.

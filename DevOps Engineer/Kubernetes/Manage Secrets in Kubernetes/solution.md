#### Manage Secrets in Kubernetes

1. Change directory to `/home/thor` on jump server,

```
thor@jump_host /$ cd /home/thor/
```

2. Use alias k as kubectl utility,

```
thor@jump_host ~$ alias k='kubectl'
```

3. Check the `ecommerce.txt` secret key file,

```
thor@jump_host ~$ cat /opt/ecommerce.txt
5ecur3!
```

4. Now, create a secret.yaml template using imperative command,

```
thor@jump_host ~$ k create secret generic ecommerce  --from-file=/opt/ecommerce.txt --dry-run=client -o yaml > secret.yaml
```

5. Edit the secret.yaml and add a type as generic,

```
thor@jump_host ~$ vi secret.yaml
```
*Note: Refer current directroy for config*

6. Create a secret,

```
thor@jump_host ~$ k create -f secret.yaml
secret/ecommerce  created
```

7. Validate that secret has created correctly,

```
thor@jump_host ~$ k get secret
NAME                  TYPE                                  DATA   AGE
default-token-p4vxn   kubernetes.io/service-account-token   3      10h
ecommerce             generic                               1      4s
```

8. Now, create a `pod.yaml` config,

```
thor@jump_host ~$ vi pod.yaml
```
*Note: Refer same directory for config*

9. Create a a pod,

```
thor@jump_host ~$ k create -f pod.yaml
pod/secret-nautilus created
```

10. Check the pod status,

```
thor@jump_host ~$ k get pods
NAME              READY   STATUS              RESTARTS   AGE
secret-nautilus   0/1     ContainerCreating   0          3s

thor@jump_host ~$ k get pods
NAME              READY   STATUS    RESTARTS   AGE
secret-nautilus   1/1     Running   0          7s
```

11. Now, validate that secrets are mounted correctly and we can see the same password file above inside the container. Take a bash shell inside a pod,

```
thor@jump_host ~$ k exec -it secret-nautilus /bin/bash
kubectl exec [POD] [COMMAND] is DEPRECATED and will be removed in a future version. Use kubectl kubectl exec [POD] -- [COMMAND] instead.
```

12. Mount path is `/opt/games`, change directory to this path and cat a file,

```
root@secret-nautilus:/# cd /opt/games/

root@secret-nautilus:/opt/games# ls -ltr
total 0
lrwxrwxrwx 1 root root 20 Oct 25 04:24 ecommerce.txt -> ..data/ecommerce.txt

root@secret-nautilus:/opt/games# cat ecommerce.txt
5ecur3!
```

Thank you.

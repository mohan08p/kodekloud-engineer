#### Init Containers in Kubernetes

1. Change directory to `/home/thor` on jump host,

```
thor@jump_host /$ cd /home/thor/
```

2. Now, create a file `deployment.yml` for manifest creation,

```
thor@jump_host ~$ vi deployment.yml
```

*Note: Check current directory for the same file*

3. Now, create a deployment using the command,

```
thor@jump_host ~$ kubectl create -f deployment.yml
deployment.apps/ic-deploy-nautilus created
```

4. Check the deployment and pod status respetively,

```
thor@jump_host ~$ kubectl get deploy
NAME                 READY   UP-TO-DATE   AVAILABLE   AGE
ic-deploy-nautilus   0/1     1            0           7s
thor@jump_host ~$ kubectl get pods
NAME                                 READY   STATUS            RESTARTS   AGE
ic-deploy-nautilus-5f9b98b7f-qsp76   0/1     PodInitializing   0          12s
thor@jump_host ~$ kubectl get pods
NAME                                 READY   STATUS    RESTARTS   AGE
ic-deploy-nautilus-5f9b98b7f-qsp76   1/1     Running   0          18s
```

5. Check the pod logs if it is printing the statement we set up in configuration,

```
thor@jump_host ~$ kubectl logs -f ic-deploy-nautilus-5f9b98b7f-qsp76
Init Done - Welcome to xFusionCorp Industries
Init Done - Welcome to xFusionCorp Industries
Init Done - Welcome to xFusionCorp Industries
Init Done - Welcome to xFusionCorp Industries
Init Done - Welcome to xFusionCorp Industries
Init Done - Welcome to xFusionCorp Industries
Init Done - Welcome to xFusionCorp Industries
```

6. Also, validate using the `kubectl describe` command that both contianers got created,


```
thor@jump_host ~$ kubectl describe pod ic-deploy-nautilus-5f9b98b7f-qsp76

...
...
...
Init Containers:  ic-msg-nautilus:
    Container ID:  docker://2e02c85fc906567b913804d7e4270523a37aed737493a34277c2a75289a44b4c
    Image:         fedora:latest
    Image ID:      docker-pullable://fedora@sha256:d6a6d60fda1b22b6d5fe3c3b2abe2554b60432b7b215adc11a2b5fae16f50188
    Port:          <none>
    Host Port:     <none>
    Command:
      /bin/bash
    Args:
      -c
      echo Init Done - Welcome to xFusionCorp Industries > /ic/beta
    State:          Terminated
      Reason:       Completed
      Exit Code:    0
      Started:      Sat, 19 Sep 2020 14:33:07 +0000
      Finished:     Sat, 19 Sep 2020 14:33:07 +0000
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /ic from ic-volume-nautilus (rw)
      /var/run/secrets/kubernetes.io/serviceaccount from default-token-nnzs6 (ro)
Containers:
  ic-main-nautilus:
    Container ID:  docker://12984f5c35b4898df852e24129b0354e5f3bb0386addf968d3bcbbc1bff74c82
    Image:         fedora:latest
    Image ID:      docker-pullable://fedora@sha256:d6a6d60fda1b22b6d5fe3c3b2abe2554b60432b7b215adc11a2b5fae16f50188
    Port:          <none>
    Host Port:     <none>
    Command:
      /bin/bash
    Args:
...
...
...
```

7. Finall,y check that the volume is mounted inside the container using `kubectl exex`,

```
thor@jump_host ~$ kubectl exec -it ic-deploy-nautilus-5f9b98b7f-qsp76 /bin/bash
kubectl exec [POD] [COMMAND] is DEPRECATED and will be removed in a future version. Use kubectl kubectl exec [POD] -- [COMMAND] instead.

[root@ic-deploy-nautilus-5f9b98b7f-qsp76 /]# cd /ic/

[root@ic-deploy-nautilus-5f9b98b7f-qsp76 ic]# ls -ltr
total 4
-rw-r--r-- 1 root root 46 Sep 19 14:33 beta

[root@ic-deploy-nautilus-5f9b98b7f-qsp76 ic]# cat beta
Init Done - Welcome to xFusionCorp Industries

[root@ic-deploy-nautilus-5f9b98b7f-qsp76 ic]#
```

Thank you.

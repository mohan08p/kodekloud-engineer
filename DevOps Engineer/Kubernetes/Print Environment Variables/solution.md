#### Print Environment Variables


1. Change directory to `/home/thor`,

```
thor@jump_host /$ cd /home/thor/
```

2. Create a pod manifest file `pod.yml`. Refer in the same directory

3. Once you complete a manifest file, create a pod from the above manifest file,

```
thor@jump_host ~$ kubectl create -f pod.yml
pod/print-envars-greeting created
```

4. Check the status of pod,

```
thor@jump_host ~$ kubectl get pods
NAME                    READY   STATUS      RESTARTS   AGE
print-envars-greeting   0/1     Completed   0          6s
```

5. Check the output using logs command,

```
thor@jump_host ~$ kubectl logs -f print-envars-greeting
Welcome to Nautilus Ltd
```
Thank you.


#### Environment Variables in Kubernetes

1. Change directory to `/home/thor` and create pod.yaml manifest file pod creation,

```
cd /home/thor/

vi pod.yaml
```

For file content check the `pod.yaml` file in the current directroy

2. Create a namespace named `fieldref-namespace`,

```
thor@jump_host ~$ kubectl create namespace fieldref-namespace
namespace/fieldref-namespace created
```

3. Now, create a pod using above manifest file.

```
kubectl create -f pod.yaml
pod/envars-fieldref created
```

4. Finally verify logs to confirm it is writing correct output.

```
thor@jump_host ~$ kubectl logs envars-fieldref -n fieldref-namespace
-en

node01
envars-fieldref
fieldref-namespace
10.44.0.1
default
```

Thank you.


#### Kubernetes Time Check Pod

Create files `namespace.yaml`, `configmap.yaml` and `pod.yaml` respectively and refer it's content in the same directory.

Apply the configuration first as namespace manifest,

```
thor@jump_host ~$ kubectl create -f namespace.yaml
namespace/datacenter created
```

Create a configmap using the command,

```
thor@jump_host ~$ kubectl create -f configmap.yaml
configmap/time-config created
```
Finally create a pod,

```
thor@jump_host ~$ kubectl create -f pod.yaml
pod/time-check created
```
Check the status using following commands,

```
thor@jump_host ~$ kubectl get pods
No resources found in default namespace.

thor@jump_host ~$ kubectl get pods -n datacenter
NAME         READY   STATUS    RESTARTS   AGE
time-check   1/1     Running   0          23s

thor@jump_host ~$ kubectl get configmap -n datacenter
NAME          DATA   AGEtime-config   1      2m11s

thor@jump_host ~$ kubectl get pods -n datacenter
NAME         READY   STATUS    RESTARTS   AGE
time-check   1/1     Running   0          42s
```
Finally veridy that log streams for the respective times,

![Exec Pod](/images/TimeCheckPod.JPG)

Thank you.

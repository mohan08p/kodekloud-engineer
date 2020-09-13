#### Create Namespaces in Kubernetes Cluster

1. First, create a `dev` namespace using kubectl utility,

```
thor@jump_host /$ kubectl create namespace dev
namespace/dev created
```

2. Now, create a pod `dev-nginx-pod` using image nginx latest,

```
thor@jump_host /$ kubectl run dev-nginx-pod --image nginx:latest --namespace dev
pod/dev-nginx-pod created
```

3. Check the pod status, 

```
thor@jump_host /$ kubectl get pods --namespace dev
NAME            READY   STATUS              RESTARTS   AGE
dev-nginx-pod   0/1     ContainerCreating   0          6s

thor@jump_host /$ kubectl get pods --namespace dev
NAME            READY   STATUS    RESTARTS   AGE
dev-nginx-pod   1/1     Running   0          10s
```

Thank you.

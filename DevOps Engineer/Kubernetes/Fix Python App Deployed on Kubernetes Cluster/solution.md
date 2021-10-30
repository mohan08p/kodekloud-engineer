#### Fix Python App Deployed on Kubernetes Cluster

1. Change directory to `/home/thor` on jump box,

```
thor@jump_host /$ cd /home/thor/
```

2. Use alias k as kubectl,

```
thor@jump_host ~$ alias k='kubectl'
```

3. Check the pod and deployment status,

```
thor@jump_host ~$ k get po
NAME                                        READY   STATUS             RESTARTS   AGE
python-deployment-devops-54f5444ffb-fvfsv   0/1     ImagePullBackOff   0          4m48s

thor@jump_host ~$ k get deploy
NAME                       READY   UP-TO-DATE   AVAILABLE   AGE
python-deployment-devops   0/1     1            0           4m53s
```

4. Now, use the describe command on pod to understand the last activity happened on pods. There you could see the image isn't right, either it's not present or you need authorization. 

5. Next, chekc the deployment configuration, and we can see the image name is incorrect and make the correction as shown below,

```
thor@jump_host ~$ k edit deploy python-deployment-devops
...
...    
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: python_app
    spec:
      containers:
      - image: poroko/flask-demo-app
        imagePullPolicy: Always
        name: python-container-devops
        ports:
        - containerPort: 5000
          protocol: TCP
...
...
```

6. Now, check the pods and deployment status again,

```
thor@jump_host ~$ k get po
NAME                                        READY   STATUS              RESTARTS   AGE
python-deployment-devops-54f5444ffb-fvfsv   0/1     ImagePullBackOff    0          6m
python-deployment-devops-7f4b76855b-9fv58   0/1     ContainerCreating   0          30s

thor@jump_host ~$ k get po
NAME                                        READY   STATUS        RESTARTS   AGE
python-deployment-devops-54f5444ffb-fvfsv   0/1     Terminating   0          6m20s
python-deployment-devops-7f4b76855b-9fv58   1/1     Running       0          50s

thor@jump_host ~$ k get deploy
NAME                       READY   UP-TO-DATE   AVAILABLE   AGE
python-deployment-devops   1/1     1            1           6m36s
```

7. Now, check the service status,

```
thor@jump_host ~$ k get svc
NAME                    TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
kubernetes              ClusterIP   10.96.0.1      <none>        443/TCP          120m
python-service-devops   NodePort    10.96.15.240   <none>        8080:32345/TCP   8m26s
```

8. Verify the ports i.e. port on the container which is map to port on the service. We can see the target port is different, you can change the target port in the service file.

9. Edit hte service and change the target port,

```
thor@jump_host ~$ k edit svc python-service-devops
...
...
spec:
  clusterIP: 10.96.15.240
  clusterIPs:
  - 10.96.15.240
  externalTrafficPolicy: Cluster
  ipFamilies:
  - IPv4
  ipFamilyPolicy: SingleStack
  ports:
  - nodePort: 32345
    port: 8080
    protocol: TCP
    targetPort: 8080
  selector:
    app: python_app
  sessionAffinity: None
  type: NodePort
status:
  loadBalancer: {}
```

10. Now try accessing application on the node port mentioend i.e. port 32345, you should the web page.

![Python Web App](/images/python-web-app.png)

Thank you.

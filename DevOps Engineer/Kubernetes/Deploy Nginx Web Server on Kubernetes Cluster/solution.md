#### Deploy Nginx Web Server on Kubernetes Cluster

1. Change directory to `/home/thor` on jum host,

```
thor@jump_host /$ cd /home/thor/
```

2. Create a `deployment.yml` and `service.yml` configuration file respectively.

```
thor@jump_host ~$ vi deployment.yml
thor@jump_host ~$ vi service.yml
```
*Refer same directory for these manifest files*

3. Create a deployment first using kubectl utility,

```
thor@jump_host ~$ kubectl create -f deployment.yml
deployment.apps/nginx-deployment created
```

4. Validate that the deployment is created successfully,

```
thor@jump_host ~$ kubectl get deployment
NAME               READY   UP-TO-DATE   AVAILABLE   AGE
nginx-deployment   0/3     3            0           9s
thor@jump_host ~$ kubectl get deployment
NAME               READY   UP-TO-DATE   AVAILABLE   AGE
nginx-deployment   3/3     3            3           13s
```

5. As the deployment has created replicase-set and in turn it created pods and from above step we can see 3 replicas available, now we can create a `service` using kubectl utility,

```
thor@jump_host ~$ kubectl create -f service.yml
service/nginx-service created
```

6. Check the deployment and service status,

```
thor@jump_host ~$ kubectl get deploy
NAME               READY   UP-TO-DATE   AVAILABLE   AGE
nginx-deployment   3/3     3            3           35s
thor@jump_host ~$ kubectl get svc
NAME            TYPE        CLUSTER-IP    EXTERNAL-IP   PORT(S)        AGE
kubernetes      ClusterIP   10.96.0.1     <none>        443/TCP        175m
nginx-service   NodePort    10.97.71.52   <none>        80:30011/TCP   13s
```

7. Finally, check the application on port 30011 by clicking on view port on Host 1, and add port 30011 and click submit, you will see nginx default page as below,

![Default Nginx Page](/images/WelcomeNginx.JPG)

Thank you.

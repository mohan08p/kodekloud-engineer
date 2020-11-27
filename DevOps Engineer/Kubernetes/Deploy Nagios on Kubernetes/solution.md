#### Deploy Nagios on Kubernetes

1. Change directory to `/home/thor` on jump server,

```
thor@jump_host /$ cd /home/thor/
```

2. Use alias k as kubectl utility,

```
thor@jump_host ~$ alias k='kubectl'
```

3. Now, create a new file named `nagios-app.yaml`,

```
thor@jump_host ~$ vi nagios-app.yaml
```
*Note: Refer same directory for config*


4. Create a deployment and service respectively,

```
thor@jump_host ~$ k create -f nagios-app.yaml
deployment.apps/nagios-deployment created
service/nagios-service created
```

5. Check the pods and deployment status,

```
hor@jump_host ~$ k get pod
NAME                                 READY   STATUS              RESTARTS   AGE
nagios-deployment-5b84554d78-fx7x9   0/1     ContainerCreating   0          32s

thor@jump_host ~$ k get deploy
NAME                READY   UP-TO-DATE   AVAILABLE   AGE
nagios-deployment   0/1     1            0           36s

thor@jump_host ~$ k get svc
NAME             TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
kubernetes       ClusterIP   10.96.0.1       <none>        443/TCP        2m8s
nagios-service   NodePort    10.110.158.86   <none>        80:30008/TCP   40s

thor@jump_host ~$ k get pod
NAME                                 READY   STATUS    RESTARTS   AGE
nagios-deployment-5b84554d78-fx7x9   1/1     Running   0          44s

thor@jump_host ~$ k get deploy
NAME                READY   UP-TO-DATE   AVAILABLE   AGE
nagios-deployment   1/1     1            1           49s
```

6. Now, as mentioned in step 2, we need to create a username and password to login to Nagios dashboard. We can do it by getting a shell inside a container as shown below,

```
thor@jump_host ~$ k exec -it nagios-deployment-5b84554d78-fx7x9 /bin/bash
kubectl exec [POD] [COMMAND] is DEPRECATED and will be removed in a future version. Use kubectl exec [POD] -- [COMMAND] instead.

root@nagios-deployment-5b84554d78-fx7x9:/# htpasswd -c /opt/nagios/etc/htpasswd.users xFusionCorp
New password:Re-type new password:
Adding password for user xFusionCorp
```

7. Finally, we can access the application and check the dashboard,

![NagiOS Login Page](/images/nagiosAppLogin.JPG)

![NagiOS Dashboard](/images/nagiosAppDashboard.JPG)

Thank you.

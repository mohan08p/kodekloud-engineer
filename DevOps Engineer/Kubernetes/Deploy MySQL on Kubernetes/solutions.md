#### Deploy MySQL on Kuberentes

1. Change directory to `/home/thor` on jump host,

```
thor@jump_host /$ cd /home/thor/
```

2. Use alias k as kubectl utility,

```
thor@jump_host ~$ alias k='kubectl'
```

3. Now create a persistent volume and persistent volume claim and apply these configurations,

```
thor@jump_host ~$ vi pv.yaml
thor@jump_host ~$ vi pvc.yaml

thor@jump_host ~$ k create -f .
persistentvolume/mysql-pv created
persistentvolumeclaim/mysql-pv-claim created
```

*Note: Refer same directory for config files*

4. Create a deployment and service configs as `mysql-app.yaml`,

```
thor@jump_host ~$ vi mysql-app.yaml
```

5. Now, before creating secrets we need to encode the username and password to base64, as shown below,

```
thor@jump_host ~$ echo -n 'kodekloud_tim' | base64
a29kZWtsb3VkX3RpbQ==

thor@jump_host ~$ echo -n 'LQfKeWWxWD' | base64
TFFmS2VXV3hXRA==

thor@jump_host ~$ echo -n 'kodekloud_db6' | base64
a29kZWtsb3VkX2RiNg==
```

6. Now create a secrets.yaml config file for creating different secrets, and apply the configuration,

```
thor@jump_host ~$ vi secrets.yaml


thor@jump_host ~$ k create -f secrets.yaml
secret/mysql-root-pass created
secret/mysql-user-pass created
secret/mysql-db-url created
```

7. Finally, go ahead and apply the configuration for MySQL deployment and service config,

```
thor@jump_host ~$ k create -f mysql-app.yaml 
deployment.apps/mysql-deployment created
service/mysql created
```

8. Check the deployment and pods status, respectively.

```
thor@jump_host ~$ k get deploy
NAME               READY   UP-TO-DATE   AVAILABLE   AGE
mysql-deployment   0/1     1            0           6s

thor@jump_host ~$ k get po
NAME                               READY   STATUS              RESTARTS   AGE
mysql-deployment-5b6b7778f-cnhjb   0/1     ContainerCreating   0          9s

thor@jump_host ~$ k get po
NAME                               READY   STATUS    RESTARTS   AGE
mysql-deployment-5b6b7778f-cnhjb   1/1     Running   0          54s
```

9. Check the service status,

```
thor@jump_host ~$ k get svc
NAME         TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
kubernetes   ClusterIP   10.96.0.1      <none>        443/TCP          40m
mysql        NodePort    10.96.56.189   <none>        3306:30007/TCP   4m54s
```

**Note**: Once the pod is up and running you can use `kubectl exec` to run MySQL commands and connect to the database using credentials used in Secrets.

Thank you.
#### Deploy Apache Web Server on Kubernetes Cluster

1. Change directory to `/home/thor` on jump server,

```
thor@jump_host /$ cd /home/thor/
```

2. Use alias k as kubectl utility,

```
thor@jump_host ~$ alias k='kubectl'
```

3. Now, create a new file named `apache-app.yaml`,

```
thor@jump_host ~$ vi apache-app.yaml
```
*Note: Refer same directory for config*


4. Create a deployment and service respectively,

```
thor@jump_host ~$ k create -f apache-app.yaml
deployment.apps/httpd-deployment-datacenter created
service/httpd-service-datacenter created
```

5. Check the pods and deployment status,

```
thor@jump_host ~$ k get pods -n httpd-namespace-datacenter
NAME                                           READY   STATUS    RESTARTS   AGE
httpd-deployment-datacenter-64647444c9-2srlt   1/1     Running   0          16s
httpd-deployment-datacenter-64647444c9-5mqmj   1/1     Running   0          16s
httpd-deployment-datacenter-64647444c9-fq4nf   1/1     Running   0          16s
httpd-deployment-datacenter-64647444c9-nttb4   1/1     Running   0          16s

thor@jump_host ~$ k get deploy -n httpd-namespace-datacenter
NAME                          READY   UP-TO-DATE   AVAILABLE   AGE
httpd-deployment-datacenter   4/4     4            4           72s

thor@jump_host ~$ k get svc -n httpd-namespace-datacenter
NAME                       TYPE       CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
httpd-service-datacenter   NodePort   10.110.78.164   <none>        80:30004/TCP   77s
```

6. Finally, test the application on port 30004 and it shows message, it works.

Thank you.

#### Deploy Grafana on Kubernetes Cluster

1. Change directory to `/home/thor` on jump box,

```
thor@jump_host /$ cd /home/thor/
```

2. Now, create a config file for deployment and service respectively,

```
thor@jump_host ~$ vi grafana-app.yaml
```
*Note: Check current directory for the config*

3. Use alias k as kubectl,

```
thor@jump_host ~$ alias k='kubectl'
```

4. Create a namespace `grafana-monitoring-datacenter`,

```
thor@jump_host ~$ k create ns grafana-monitoring-datacenter
namespace/grafana-monitoring-datacenter created
```

5. Apply the config file, so it will create a deployment and service resepctively,

```
thor@jump_host ~$ k create -f grafana-app.yaml
deployment.apps/grafana-deployment-datacenter created
service/grafana-service-datacenter created
```

6. Check the status of pod, deployment,

```
thor@jump_host ~$ k get pods -n grafana-monitoring-datacenter
NAME                                           READY   STATUS    RESTARTS   AGE
grafana-deployment-datacenter-6cb56464-5jhl7   1/1     Running   0          26s
thor@jump_host ~$ k get deploy -n grafana-monitoring-datacenter
NAME                            READY   UP-TO-DATE   AVAILABLE   AGE
grafana-deployment-datacenter   1/1     1            1           33s
thor@jump_host ~$ k get svc -n grafana-monitoring-datacenter
NAME                         TYPE       CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
grafana-service-datacenter   NodePort   10.110.85.203   <none>        3000:32000/TCP   40s
```

7. Finally, login to grafana dashboard using default credentials, admin/admin,

![Grafana Dashboard](/images/GrafanaDashboard.JPG)

Thank you.

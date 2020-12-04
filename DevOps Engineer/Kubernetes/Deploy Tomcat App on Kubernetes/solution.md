#### Deploy Tomcat App on Kubernetes

1. Change directory to `/home/thor` on jump box,

```
thor@jump_host /$ cd /home/thor/
```

2. Now, create a config file for deployment and service respectively,

```
thor@jump_host ~$ vi tomcat-app.yaml
```
*Note: Check current directory for the config*

3. Use alias k as kubectl,

```
thor@jump_host ~$ alias k='kubectl'
```

4. Create a namespace `tomcat-namespace-xfusion`,

```
thor@jump_host ~$ k create ns tomcat-namespace-xfusion
namespace/tomcat-namespace-xfusion created
```

5. Now, apply the config file which will create a deployment and service respectively.

```
thor@jump_host ~$ k create -f tomcat-app.yaml
deployment.apps/tomcat-deployment-xfusion created
service/tomcat-service-xfusion created
```

6. Check the pods and deployment status,

```
thor@jump_host ~$ k get deploy -n tomcat-namespace-xfusion
NAME                        READY   UP-TO-DATE   AVAILABLE   AGE
tomcat-deployment-xfusion   0/1     1            0           13s

thor@jump_host ~$ k get po -n tomcat-namespace-xfusion
NAME                                         READY   STATUS              RESTARTS   AGE
tomcat-deployment-xfusion-5bd7cf974b-rq2bk   0/1     ContainerCreating   0          20s

thor@jump_host ~$ k get po -n tomcat-namespace-xfusion
NAME                                         READY   STATUS    RESTARTS   AGE
tomcat-deployment-xfusion-5bd7cf974b-rq2bk   1/1     Running   0          29s

thor@jump_host ~$ k get deploy -n tomcat-namespace-xfusion
NAME                        READY   UP-TO-DATE   AVAILABLE   AGE
tomcat-deployment-xfusion   1/1     1            1           33s
```

7. Now, get the ip of the worker node,

```
thor@jump_host ~$ k get no -o wide
NAME           STATUS   ROLES    AGE     VERSION   INTERNAL-IP   EXTERNAL-IP   OS-IMAGE             KERNEL-VERSION       CONTAINER-RUNTIME
controlplane   Ready    master   7m46s   v1.16.4   172.17.0.8    <none>        Ubuntu 18.04.4 LTS   4.15.0-109-generic   docker://19.3.6
node01         Ready    <none>   7m9s    v1.16.0   172.17.0.33   <none>        Ubuntu 18.04.4 LTS   4.15.0-109-generic   docker://19.3.6
```

8. Check the resposne using curl api on port 32227,

```
thor@jump_host ~$ curl 172.17.0.33:32227
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>SampleWebApp</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <h2>Welcome to xFusionCorp Industries!</h2>
        <br>

    </body>
</html>
```

9. Also, we can access the application on port 32227 inside browser,

![Simple Tomcat App](/images/TomcatSampleWebApp.JPG)

Thank you.

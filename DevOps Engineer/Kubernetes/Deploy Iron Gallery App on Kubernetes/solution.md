#### Deploy Iron Gallery App on Kubernetes

1. Change directory to `/home/thor` on jump box,

```
thor@jump_host /$ cd /home/thor/
```

2. Use alias k as kubectl,

```
thor@jump_host ~$ alias k='kubectl'
```

3. Create a namespace named `iron-namespace-xfusion`,

```
thor@jump_host ~$ k create ns iron-namespace-xfusion
namespace/iron-namespace-xfusion created
```

4. Create a new file `iron-gallery.yaml` for writing config of deployment and service, respectively.

```
thor@jump_host ~$ vi iron-gallery.yaml
```

5. Apply this configuration, which will create a deployment and a service,

```
thor@jump_host ~$ k create -f iron-gallery.yaml
deployment.apps/iron-gallery-deployment-xfusion created
service/iron-gallery-service-xfusion created
```

6. Create a new file `mariadb-app.yaml` for writing config of deployment and service, respectively.

```
thor@jump_host ~$ vi mariadb-app.yaml
```

7. Apply this configuration, which will create a deployment and a service,

```
thor@jump_host ~$ k create -f mariadb-app.yaml
deployment.apps/iron-db-deployment-xfusion created
service/iron-db-service-xfusion created
```

8. You can check the status of the pods, deployment and services respectively.

9. Now, access the web page on port 32678, 

![Lychee Login Page](/images/LycheeLoginPage.JPG)

Thank you.

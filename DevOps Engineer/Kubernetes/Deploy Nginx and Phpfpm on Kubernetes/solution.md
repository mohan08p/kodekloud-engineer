#### Deploy Nginx and Phpfpm on Kubernetes

1. Change directory to `/home/thor` on jump box,

```
thor@jump_host /$ cd /home/thor/
```

2. Use alias k as kubectl,

```
thor@jump_host ~$ alias k='kubectl'
```

3. Create a service called `nginx-service` using config file nginx-service.yaml,

```
thor@jump_host ~$ vi nginx-service.yaml

thor@jump_host ~$ k create -f nginx-service.yaml
service/nginx-service created
```
*Note: Check current directory for the config*

4. Now, create a config file for configmap and pod respectively,

```
thor@jump_host ~$ vi nginx-php-app.yaml
```
*Note: Check current directory for the config*

5. Apply the config file, so it will create a configmap and pod resepctively,

```
thor@jump_host ~$ k create -f nginx-php-app.yaml
configmap/nginx-config created
pod/nginx-phpfpm created
```

6. Wait till both the containers are in running state.

```
thor@jump_host /$ kubectl get pods
NAME           READY   STATUS              RESTARTS   AGE
nginx-phpfpm   2/2     Running   0          45s
```

*This node you might not need to perform anymore.*
Note: You will see the response from the app 403 Forbidden which is ok as in document root, there is no file named index.php, etc.
For debugging you can ssh to container and check the document root and locally accessing application,

```
kubectl exec -it nginx-phpfpm -c nginx-container – /bin/bash

curl localhost:8098

Similarly check with other container in the pod.
```

7. Copy `index.php` file from jump host to `nginx-container` using kubectl cp command,

```
kubectl cp /opt/index.php nginx-phpfpm:/var/www/html -c nginx-container
```

8. Now you can access the web application by using App button on the top bar,

![Nginx-php App](/images/nginx-php-app.png)

Thank you.

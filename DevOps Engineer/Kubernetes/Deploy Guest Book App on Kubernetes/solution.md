#### Deploy Guest Book App on Kubernetes

1. Change directory to `/home/thor/`,

```
thor@jump_host /$ cd /home/thor/
```

2. Now, create the respective manifest files for redis master, redis slave and frontend tier, respectively. So, each one will have a deployment and it's service file as shown below,

```
thor@jump_host ~$ vi redis-master-deployment.yml
thor@jump_host ~$ vi redis-master-service.yml
thor@jump_host ~$ vi redis-slave-deployment.yml
thor@jump_host ~$ vi redis-slave-service.yml
thor@jump_host ~$ vi frontend-deployment.yml
thor@jump_host ~$ vi frontend-service.yml
```

*NOTE: Refer current directory for these manifest configuration files*

3. Now, apply the configuration manifests for these respective tiers as below,

```
thor@jump_host ~$ kubectl create -f .
deployment.apps/frontend created
deployment.apps/redis-master created
service/redis-master created
deployment.apps/redis-slave created
service/redis-slave created
service/frontend created
```

4. We can see the respective deployment and service files get created for each tier. You can validate using below commands,

```
thor@jump_host /$ kubectl get deploy
thor@jump_host /$ kubectl get pods
thor@jump_host /$ kubectl get svc
```

5. Finally, check guestbook application by clicking on + button on top left corner and select Select port to view on Host 1 then enter your nodePort.

![GuestBook Application](/images/GuestBookAppFrontend.JPG)

Thank you.

#### Kubernetes Redis Deployment

1. Change directory to `/home/thor` on jump server,

```
thor@jump_host /$ cd /home/thor/
```

2. Use alias k as kubectl utility,

```
thor@jump_host ~$ alias k='kubectl'
```

3. Now, write `apps.yaml` config for creating configmap and deployment,

```
thor@jump_host ~$ vi pod.yaml
```
*Note: Refer same directory for config*

4. Create a configmap and deployment,

```
thor@jump_host ~$ k create -f apps.yaml
configmap/my-redis-config created
deployment/redis-deployment created
```

5. Check the pod and deployment status, respectively.

Thank you.

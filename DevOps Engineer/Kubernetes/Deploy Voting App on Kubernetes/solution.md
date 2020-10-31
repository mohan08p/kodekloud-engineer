#### Deploy Voting App on Kubernetes

1. Change directory to `/home/thor` on jump server,

```
thor@jump_host /$ cd /home/thor/
```

2. Use alias k as kubectl utility,

```
thor@jump_host ~$ alias k='kubectl'
```

3. First, create a `vote` namespace,

```
thor@jump_host ~$ k create ns vote
namespace/vote created
```

4. Create a file for voting application deployment and service,

```
thor@jump_host ~$ vi vote-resource.yaml
```
*Note: Refer same directory for config*

5. Deploy the voting app which will create a  deployment and service, respectively,


```
thor@jump_host ~$ k create -f vote-resource.yaml
deployment.apps/vote-deployment created
service/vote-service created
```

6. Create a file for redis deployment and service,

```
thor@jump_host ~$ vi redis-resource.yaml
```
*Note: Refer same directory for config*

7. Deploy the redis app, respectively,

```
thor@jump_host ~$ k create -f redis-resource.yaml
deployment.apps/redis-deployment created
service/redis created
```

8. Create a file for worker deployment,

```
thor@jump_host ~$ vi worker_deploy.yaml
```
*Note: Refer same directory for config*

9. Deploy the worker,

```
thor@jump_host ~$ k create -f worker_deploy.yaml
deployment.apps/worker created
```

10. Create a file for deploying database, deployment and service respectively,

```
thor@jump_host ~$ vi db-resource.yaml
```
*Note: Refer same directory for config*


11. Deploy the database app,

```
thor@jump_host ~$ k create -f db-resource.yaml
deployment.apps/db-deployment created
service/db created
```

12. Create a file for result application, deployment and service, respectively,

```
thor@jump_host ~$ vi result-resource.yaml
```
*Note: Refer same directory for config*

13. Deploy the result application,

```
thor@jump_host ~$ k create -f result-resource.yaml
deployment.apps/result-deployment created
service/result-service created
```

14. Now, check the pod status,

```
thor@jump_host ~$ k get pods -n vote
NAME                                 READY   STATUS    RESTARTS   AGE
db-deployment-64c9c554dc-6lwg4       1/1     Running   0          100s
redis-deployment-566f998bd-7b7fl     1/1     Running   0          4m36s
result-deployment-597945486b-rztjx   1/1     Running   0          45s
vote-deployment-757d4bf797-9thhr     1/1     Running   0          6m36s
worker-7d56587475-678pd              1/1     Running   4          3m32s
```

15. Check the logs of the `result-deployment`, we can see it has connected to the database correctly,

```
hor@jump_host ~$ k logs -f result-deployment-597945486b-rztjx -n vote
Sat, 31 Oct 2020 08:26:11 GMT body-parser deprecated bodyParser: use individual json/urlencoded middlewares at server.js:67:9
Sat, 31 Oct 2020 08:26:11 GMT body-parser deprecated undefined extended: provide extended option at ../node_modules/body-parser/index.js:105:29App running on port 80
Connected to db
```

16. Check the `worker-deployment` logs, we can option a and b choose and process by a resepctive worker,

```
thor@jump_host ~$ k logs -f worker-7d56587475-678pd -n vote
Connected to db
Connecting to redis
Found redis at 10.99.89.142
Processing vote for 'b' by 'b688d49ada41ffe1'
Processing vote for 'b' by 'b688d49ada41ffe1'
Processing vote for 'b' by 'b688d49ada41ffe1'
```

17. Now, check the voting application on port 31000, we can see as below,

![Voting App Dashboard](/images/VotingAppDashboard.JPG)


18. Finally validate the result application to check if vote is made to the either of one option between two.

![Voting App Result](/images/VotingAppResult.JPG)

Thank you.

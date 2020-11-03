#### Fix issues with Lemp Stack

1. Use alias k as kubectl utility,

```
thor@jump_host ~$ alias k='kubectl'
```

2. The `nginx.conf` is passed thought the configmap. So, check the listen port in configmap is http port 80 or not. If it's different, then, change it to 80, we can see it as below,

```
thor@jump_host /$ k get cm nginx-config -o yaml
apiVersion: v1
data:
  nginx.conf: |
    events {
    }
    http {
      server {
        listen 80 default_server;
        listen [::]:80 default_server;
...
...
```
		
3. Also, nodePort is different, as in the problem statement, it should be 30008, so change it 30008 and port and targetPort to 80, respectively.

```
thor@jump_host ~$ k get svc nginx-service -o yaml
...
...
spec:
  clusterIP: 10.106.219.6
  externalTrafficPolicy: Cluster
  ports:
  - nodePort: 30008
    port: 80
    protocol: TCP    
	targetPort: 80  
  selector:    
    app: lemp    
	tier: frontend
  sessionAffinity: None
  type: LoadBalancer
status:
  loadBalancer: {}
```

4. Now, you can access the application on port 30008, we can see the WordPress Before getting started page, as seen below,


![Wordpress Before Getting Started Page](/images/wp-gettingstarted.JPG)


5. We need to pass the DB configs to connect to MySQL database, we can get the values from secret as below we can get the DB Host, similar way get the values of the other DB details,

```
k describe secret mysql-host
k get secret mysql-host -o jsonpath='{.data.host}' | base64 --decode
```

6. Once we are connected to MySQL DB, we can see Wordpress is already installed page as below,

![Wordpress DB Already Installed Page](/images/wpDBInstalled.JPG)

Thank you.

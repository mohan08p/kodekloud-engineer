#### Kubernetes Sidecar Containers

1. Change directory to `/home/thor` and create a file `webserver-pod.yml`, as below,

```
thor@jump_host /$ vi webserver-pod.yml
```

Write a manifest file and check it's content in the same directory.

2. Next, create i.e. apply these configuration using kubectl apply.

```
thor@jump_host ~$ kubectl create -f sidecar-container.yaml
pod/webserver created
```

3. Check the pod status,

```
thor@jump_host ~$ kubectl get pods
NAME        READY   STATUS              RESTARTS   AGE
webserver   0/2     ContainerCreating   0          4s
```

4. Check the logs of these cotnainers respectively,

```
thor@jump_host ~$ kubectl logs webserver -c nginx-container
/docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
/docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
/docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
10-listen-on-ipv6-by-default.sh: Getting the checksum of /etc/nginx/conf.d/default.conf
10-listen-on-ipv6-by-default.sh: Enabled listen on IPv6 in /etc/nginx/conf.d/default.conf
/docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
/docker-entrypoint.sh: Configuration complete; ready for start up
```

5. Now get a shell inside the pod and curl to nginx server on localhost,

```
thor@jump_host ~$ k exec -it webserver /bin/bash
kubectl exec [POD] [COMMAND] is DEPRECATED and will be removed in a future version. Use kubectl kubectl exec [POD] -- [COMMAND] instead.
Defaulting container name to nginx-container.
Use 'kubectl describe pod/webserver -n default' to see all of the containers in this pod.

root@webserver:/# curl localhost
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
```

6. Also, check the access logs inside the pod container as we send a request to nginx web server, we can see the logs as below,

```
root@webserver:/# cat /var/log/nginx/access.log
127.0.0.1 - - [03/Oct/2020:14:34:01 +0000] "GET / HTTP/1.1" 200 612 "-" "curl/7.64.0" "-"
```

7. Now exit out of pod container and and check the logs of `sidecar-container` respectively,

```
thor@jump_host ~$ k logs webserver -c sidecar-container
127.0.0.1 - - [03/Oct/2020:14:34:01 +0000] "GET / HTTP/1.1" 200 612 "-" "curl/7.64.0" "-"
127.0.0.1 - - [03/Oct/2020:14:34:01 +0000] "GET / HTTP/1.1" 200 612 "-" "curl/7.64.0" "-"
127.0.0.1 - - [03/Oct/2020:14:34:31 +0000] "GET / HTTP/1.1" 200 612 "-" "curl/7.64.0" "-"
127.0.0.1 - - [03/Oct/2020:14:34:01 +0000] "GET / HTTP/1.1" 200 612 "-" "curl/7.64.0" "-"
127.0.0.1 - - [03/Oct/2020:14:34:31 +0000] "GET / HTTP/1.1" 200 612 "-" "curl/7.64.0" "-"
```

8. Finally, describe the pod and check that both cotnainers described correctly as created,

```
thor@jump_host ~$ kubectl describe pod webserver
```
![Describe Pod](/images/SidecarContainerDesc.JPG)

Thank you.

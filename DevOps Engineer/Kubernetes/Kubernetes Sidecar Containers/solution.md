#### Kubernetes Sidecar Containers

NOTE: This has failed a check as command is incorrect inside sidecar-container under webserver pod.

Change directory to `/home/thor` and create a file `sidecar-container.yaml`, as below,

```
thor@jump_host /$ vi sidecar-container.yaml
```

Write a manifest file and check it's content in the same directory.

Next, create i.e. apply these configuration using kubectl apply.

```
thor@jump_host ~$ kubectl create -f sidecar-container.yaml
pod/webserver created
```

Check the pod status,

```
thor@jump_host ~$ kubectl get pods
NAME        READY   STATUS              RESTARTS   AGE
webserver   0/2     ContainerCreating   0          4s
```

Check the logs of these cotnainers respectively,

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

Finally, describe the pod and check the cotnainers created are correct,

```
thor@jump_host ~$ kubectl describe pod webserver
```
![Describe Pod](/images/SidecarContainerDesc.JPG)

Thank you.

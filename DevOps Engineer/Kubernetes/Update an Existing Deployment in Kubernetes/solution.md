#### Update an Existing Deployment in Kubernetes

1. Use alias k as kubectl,

```
thor@jump_host ~$ alias k='kubectl'
```

2. Check the pod, deployment and services status, respectively.

```
thor@jump_host ~$ k get pods 
thor@jump_host ~$ k get deploy
thor@jump_host ~$ k get svc
```

3. Now, edit deployment named `nginx-deployment` and update the following properties,

```
thor@jump_host ~$ k edit deploy nginx-deployment

i)   Change replicas counts from 1 to 5
ii)  Update image from nginx:1.17 to nginx:latest
iii) Add the command as mentioned in problem statement,
      command: ["/bin/sh"]
      args: ["-c","while true; do apt update; apt install -y vim php ; sleep 3; done"]
```

4. Now, edit service `nginx-service`,

```
thor@jump_host ~$ k edit svc nginx-service

i) Change port from 30008 to 32165
```

5. Finally check the logs of any of running pod,

```
thor@jump_host ~$ k logs -f nginx-5654gtfyghty56
...
...

Creating config file /etc/php/7.3/mods-available/phar.ini with new version
debconf: unable to initialize frontend: Dialog
debconf: (TERM is not set, so the dialog frontend is not usable.)
debconf: falling back to frontend: Readline

Creating config file /etc/php/7.3/mods-available/posix.ini with new version
debconf: unable to initialize frontend: Dialog
debconf: (TERM is not set, so the dialog frontend is not usable.)
debconf: falling back to frontend: Readline

Creating config file /etc/php/7.3/mods-available/shmop.ini with new version
debconf: unable to initialize frontend: Dialog
debconf: (TERM is not set, so the dialog frontend is not usable.)
debconf: falling back to frontend: Readline

Creating config file /etc/php/7.3/mods-available/sockets.ini with new version
debconf: unable to initialize frontend: Dialog
debconf: (TERM is not set, so the dialog frontend is not usable.)
debconf: falling back to frontend: Readline

Creating config file /etc/php/7.3/mods-available/sysvmsg.ini with new version
debconf: unable to initialize frontend: Dialog
debconf: (TERM is not set, so the dialog frontend is not usable.)
debconf: falling back to frontend: Readline
```

Thank you.

#### Create a Docker Image From Container

1. SSH to App server 3 and check the docker images present on the server,

```
[root@stapp03 banner]# docker image ls
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
ubuntu              latest              9140108b62dc        2 days ago          72.9MB
```

2. Check the running containers status using `dokcer ps` command,

```
[root@stapp03 banner]# docker container ps
CONTAINER ID        IMAGE               COMMAND             CREATED              STATUS              PORTS               NAMES
d752a60b16d4        ubuntu              "/bin/bash"         About a minute ago   Up About a minute                       ubuntu_latest
```

3. Now, we need to create an image from this running container using `docker commit`,

```
[root@stapp03 banner]# docker commit ubuntu_latest official:xfusion
sha256:e6c1109ba95ba039a4eca23093ed953f1e8ea0a97aa29cb8cf38d82ff4b18a3a
```

4. Finally, check the image again and you can see `official:xfusion` which we created,

```
[root@stapp03 banner]# docker image ls
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
official            xfusion             e6c1109ba95b        4 seconds ago       95.8MB
ubuntu              latest              9140108b62dc        2 days ago          72.9MB
```

Thank you.

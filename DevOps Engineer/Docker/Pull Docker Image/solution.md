#### Pull Docker Image

1. SSH to App server3 and pull docker image `busybox:musl`,

```
[root@stapp03 banner]# docker image pull busybox:musl
musl: Pulling from library/busybox
34398f16a36f: Pull complete
Digest: sha256:00be5e0ed4949aefad1fdb77c6f9d053d4e3fa51a566f9f1890e49f1f0de4a9a
Status: Downloaded newer image for busybox:musl
docker.io/library/busybox:musl
```

2. List docker images,

```
[root@stapp03 banner]# docker image ls
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
busybox             musl                3bb3a78dbcc7        8 hours ago         1.47MB
```

3. Now tag this image `busybox:media`,

```
[root@stapp03 banner]# docker image tag busybox:musl busybox:media
```

4. List out the docker images again,

```
[root@stapp03 banner]# docker image ls
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
busybox             media               3bb3a78dbcc7        8 hours ago         1.47MB
busybox             musl                3bb3a78dbcc7        8 hours ago         1.47MB
```

Thank you.

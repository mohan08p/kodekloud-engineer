#### Resolve Dockerfile Issues

1. SSH to App server 3 and change directory to `/opt/docker` directory,

```
[root@stapp03 banner]# cd /opt/docker/
```

2. List out the contents,

```
[root@stapp03 docker]# ls -ltr
total 12
drwxr-xr-x 2 root root 4096 Sep 23 14:39 html
drwxr-xr-x 2 root root 4096 Sep 23 14:39 certs
-rw-r--r-- 1 root root  504 Sep 23 14:39 Dockerfile
```

3. Open a `Dockerfile` as mentioned in the task,

```
[root@stapp03 docker]# vi Dockerfile
```
*NOTE: Refer the Dockerfile content after correcting minor dir path in the current directory.*

4. Create Docker image using `docker build` command,

```
[root@stapp03 docker]# docker build -t mohan08p/httpd .
Sending build context to Docker daemon  9.216kB
Step 1/8 : FROM httpd:2.4.43
2.4.43: Pulling from library/httpd
bf5952930446: Pull complete
3d3fecf6569b: Pull complete
b5fc3125d912: Pull complete3c61041685c0: Pull complete
34b7e9053f76: Pull complete
Digest: sha256:cd88fee4eab37f0d8cd04b06ef97285ca981c27b4d685f0321e65c5d4fd49357
Status: Downloaded newer image for httpd:2.4.43
 ---> f1455599cc2e
Step 2/8 : RUN sed -i "s/Listen 80/Listen 8080/g" /usr/local/apache2/conf/httpd.conf
 ---> Running in 0db60cc8e3ba
Removing intermediate container 0db60cc8e3ba
 ---> b792355559c0
Step 3/8 : RUN sed -i '/LoadModule\ ssl_module modules\/mod_ssl.so/s/^#//g' conf/httpd.conf
 ---> Running in b6d6e53bc796
Removing intermediate container b6d6e53bc796
 ---> 396d18a652c0
Step 4/8 : RUN sed -i '/LoadModule\ socache_shmcb_module modules\/mod_socache_shmcb.so/s/^#//g' conf/httpd.conf
 ---> Running in acd7f5e130f8
Removing intermediate container acd7f5e130f8
 ---> 9b7e41f32359
Step 5/8 : RUN sed -i '/Include\ conf\/extra\/httpd-ssl.conf/s/^#//g' conf/httpd.conf
 ---> Running in 5776c6527019
Removing intermediate container 5776c6527019
 ---> ecf0a593a8a3
Step 6/8 : COPY certs/server.crt /usr/local/apache2/conf/server.crt
 ---> 587fd93aba74
Step 7/8 : COPY certs/server.key /usr/local/apache2/conf/server.key
 ---> 2232ae7104b5
Step 8/8 : COPY html/index.html /usr/local/apache2/htdocs/
 ---> 155fa0b015f0
Successfully built 155fa0b015f0
Successfully tagged mohan08p/httpd:latest
```

5. Check the respective docker images, 

```
[root@stapp03 docker]# docker image ls
REPOSITORY          TAG                 IMAGE ID            CREATED              SIZE
mohan08p/httpd      latest              155fa0b015f0        About a minute ago   166MB
httpd               2.4.43              f1455599cc2e        7 weeks ago          166MB
```

Thank you.

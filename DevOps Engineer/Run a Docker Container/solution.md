#### Run a Docker Container

SSH to App server1 and run an nginx container using nginx:alpine docker image using the following command,

    [root@stapp01 tony]# docker container run -d --name nginx_1 nginx:alpine
    Unable to find image 'nginx:alpine' locally
    alpine: Pulling from library/nginx
    cbdbe7a5bc2a: Pull complete
    85434292d1cb: Pull complete
    75fcb1e58684: Pull complete
    2a8fe5451faf: Pull complete
    42ceeab04dd4: Pull complete
    Digest: sha256:ee8c35a6944eb3cc415cd4cbeddef13927895d4ffa50b976886e3abe48b3f35aStatus: Downloaded newer image for nginx:alpine
    0bcb9b7e5f4be5c3c76a7f2c9d3fe93820d88daf39280654a055f32197003c1b

Verify that a container is running using a command,

    [root@stapp01 tony]# docker container ls
    CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS               NAMES
    0bcb9b7e5f4b        nginx:alpine        "/docker-entrypoint.…"   9 seconds ago       Up 6 seconds        80/tcp              nginx_1

Thank you.

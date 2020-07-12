#### Docker Ports Mapping

SHS to App server2 and as mentioned in task a, pull docker image `nginx:stable` using the following command,

    docker image pull nginx:stable

Now create a container out of the image and assign it a friendly name as ecommerce and map port 8085 from host machine to container port 80, use the following command,

    docker container run -d --name ecommerce -p 8085:80 nginx:stable

Now, you can validate by requesting to nginx server over the host port 8085, using the following command,

    [root@stapp02 steve]# curl localhost:8085
    <!DOCTYPE html>
    <html><head>
    <title>Welcome to nginx!</title>
    <style>
        body {
            width: 35em;
            margin: 0 auto;
            font-family: Tahoma, Verdana, Arial, sans-serif;
        }
    </style>
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

As well as we have run a container in deamon mode so it will be in a running state. Validate using the command, 

    [root@stapp02 steve]# docker container ps
    CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                  NAMES
    5e05fcfd6c07        nginx:stable        "/docker-entrypoint.…"   4 minutes ago       Up 4 minutes        0.0.0.0:8085->80/tcp   ecommerce

Thank you.

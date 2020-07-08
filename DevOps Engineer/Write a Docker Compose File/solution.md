#### Write a Docker Compose File

SSH on App server 3 and open/create a file `docker-compose.yml` and add as shown below,

    vi /opt/docker/docker-compose.yml
    ...

    version: '3'
    services:
      web:
        image: httpd
        container_name: httpd
        ports:
          - "3003:80"
        volumes:
          - /opt/data:/usr/local/apache2/htdocs

NOTE: Do not change or neglect the `container_name` in the above docker compose file, otherwise compose will assign a cotnainer a default name as per service name.

Then try to run the application web using following command,

    docker-compose up -d

You can verify using `docker container ps` command that the apache application container is running fine,

    docker container ps
    CONTAINER ID        IMAGE               COMMAND              CREATED             STATUS  PORTS                  NAMES
    3af1cb0ed8b4        httpd               "httpd-foreground"   5 minutes ago       Up 5 minutes  0.0.0.0:3003->80/tcp   httpd

Also, try accessing web aplication on port 3003 on host machine as shown below,

    curl localhost:3003
    ...
    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
    <html>
     <head>
      <title>Index of /</title>
     </head>
      <body>
    <h1>Index of /</h1>
    <ul><li><a href="index1.html"> index1.html</a></li>
    </ul>
    </body></html>

Also validate using the contianer inspect command as shown below and check the volume mapping,

    docker container inspect 3af1cb0ed8b4

![Docker Container inspect](/images/ValidateVolumeMapping.JPG)


Hope it helps.
Thanks

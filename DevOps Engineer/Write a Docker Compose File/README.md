#### Write a Docker Compose File

Nautilus application development team shared some static website content that needs to hosted on httpd web server, they want to use containerized platform for same. Team has shared some details with DevOps team and we need to setup an environment accordingly. Below are the details:

a. On App Server 3 in Stratos DC create a container named httpd using a docker compose file /opt/docker/docker-compose.yml (please use the exact name for file).

b. Use httpd (preferably latest tag) image for container and make sure container is named as httpd, you can use any name for service.

c. Map 80 number port of container with port 3003 of docker host.

d. Map container's /usr/local/apache2/htdocs volume with /opt/data volume of docker host which is already there. (please do not modify any data within these locations).

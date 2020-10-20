#### Deploy Nginx and Phpfpm on Kubernetes

The Nautilus Application team is planning to deploy one of the php-based application on Kubernetes cluster. As per discussion with DevOps team they decided to use nginx and phpfpm. Additionally, they shared some custom configuration requirements. Below you can find more details. Please complete the task as per requirements mentioned below:

1.) Create a config map nginx-config for nginx.conf as we want to add some custom settings for nginx.conf.

a) Change default port 80 to 8096 in nginx.conf.

b) Change default document root /usr/share/nginx to /var/www/html in nginx.conf.

c) Update directory index to index index.html index.htm index.php in nginx.conf.

2.) Create a pod named nginx-phpfpm .

b) Create a shared files volume shared-files that will be used by both containers (nginx and phpfpm) also it should be emptyDir: {}

c) Map the ConfigMap we declared above as a volume for the pod. Name the volume as nginx-config-volume

d) Nginx container should be named as nginx-container and it should use nginx:latest image. PhpFPM container should be named as php-fpm-container and it should use php:7.0-fpm image.

e) The shared volume shared-files should be mounted at /var/www/html location in both containers.

f) Add one more volume for nginx-container. Name it as nginx-config-volume, mount path should be /etc/nginx/nginx.conf and subPath should be nginx.conf

Before clicking on finish button always make sure to check if all pods are in running state.

Note: The kubectl utility on jump_host has been configured to work with the kubernetes cluster.

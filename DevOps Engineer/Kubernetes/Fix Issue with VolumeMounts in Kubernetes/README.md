#### Fix Issue with VolumeMounts in Kubernetes

We deployed a Nginx and PHPFPM based application on Kubernetes cluster last week and it had been working fine. This morning one of the team members made a change somewhere which caused some issues, and the application stopped working. Please look into the issue and fix it:

The pod name is nginx-phpfpm and configmap name is nginx-config, Nginx is running on port 8099. Figure out the issues and fix them.

Once you think issue is fixed copy /tmp/index.php from jump host to nginx-container under nginx document root and try to curl the nginx URL from nginx-container itself, you should be able to run the php page you copied. This step isn't mandatory but it will be helpful to test the setup.

Note: The kubectl utility on jump_host has been configured to work with the kubernetes cluster.

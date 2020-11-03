#### Fix issues with Lemp Stack

We deployed a WordPress application on Kubernetes cluster last week and it had been working fine. This morning one of the team members made some changes which caused some issues, and the application stopped working. Please look into the issue and fix it:

Wordpress deployment name is nginx-wp-dp and MySQL deployment name is mysql-deployment. Nginx server must be configured to use port 80, nodeport is 30008 and the document root for Nginx must be /var/www/html

Look into the issues and make sure WordPress website works on nodeport. Please do not change any existing deployment names, service names etc

Note:

    You should be able to load a preinstalled Wordpress website once issue is fixed so you should not get the installation page.

    The kubectl utility on jump_host has been configured to work with the kubernetes cluster.

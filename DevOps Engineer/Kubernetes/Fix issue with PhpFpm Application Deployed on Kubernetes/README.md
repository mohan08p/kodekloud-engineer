#### Fix issue with PhpFpm Application Deployed on Kubernetes

We deployed a Nginx and PHPFPM based application on Kubernetes cluster last week and it had been working fine. This morning one of the team members was troubleshooting an issue with this stack and he was supposed to run Nginx welcome page for now on this stack till issue with phpfpm is fixed but he made a change somewhere which caused some issue and the application stopped working. Please look into the issue and fix the same:


The deployment name is nginx-phpfpm-dp and service name is nginx-service. Figure out the issues and fix them. FYI Nginx is configured to use default http port, node port is 30008 and for now Nginx welcome page should run on this stack. Please do not try to delete/modify any other existing components like deployment name, service name etc.

Note: The kubectl utility on jump_host has been configured to work with the kubernetes cluster.


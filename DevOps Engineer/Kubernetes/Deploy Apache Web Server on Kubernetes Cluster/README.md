#### Deploy Apache Web Server on Kubernetes Cluster

There is an application that needs to be deployed on Kubernetes cluster under Apache web server. The Nautilus application development team has asked the DevOps team to deploy it. We need to develop a template as per requirements mentioned below:

    Create a namespace named as httpd-namespace-datacenter.

    Create a service named as httpd-service-datacenter under same namespace, targetPort should be 80 and nodePort should be 30004.

    Create a deployment named as httpd-deployment-datacenter under the same namespace as mentioned above. Use image httpd with latest tag only and remember to mention tag i.e httpd:latest, and container name should be httpd-container-datacenter. And make sure replicas counts are 4.

    Set labels app to httpd_app_datacenter.

Note: The kubectl utility on jump_host has been configured to work with the kubernetes cluster.

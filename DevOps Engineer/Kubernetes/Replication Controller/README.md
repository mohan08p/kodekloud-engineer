#### Deploy Highly Available Pods with ReplicationController

The Nautilus DevOps team is establishing a ReplicationController to deploy multiple pods for hosting applications that require a highly available infrastructure. Follow the specifications below to create the ReplicationController:

Create a ReplicationController using the nginx image with latest tag, and name it nginx-replicationcontroller.

Assign labels app as nginx_app, and type as front-end. Ensure the container is named nginx-container and set the replica count to 3.

All pods should be running state post-deployment.

Note: The kubectl utility on jump_host is configured to operate with the Kubernetes cluster.
#### Deploy Node App on Kubernetes

The Nautilus development team has completed development of one of the node application which they are planning deploy on a Kubernetes cluster. They recently had a meeting with DevOps team to share their requirements based on that DevOps team has listed out the exact requirement to setup the cluster the same. Fine below more details:

    Create a namespace named node-namespace-devops.

    Create a deployment named node-deployment-devops under this new namespace. Replica count should be 2, container should be named as node-container-devops, use gcr.io/kodekloud/centos-ssh-enabled:node image and container port should be 80.

    Create a service named node-service-devops. Service type should be NodePort, target port should be 8080, port should be 80 and nodePort should be 30012.

    Make sure all pods are in Running state after the deployment.

    You can check application page by clicking on + button on top left corner and click on Select port to view on Host 1, then enter your nodePort.

You can use any labels as per your choice.

Note: The kubectl on jump_host has been configured to work with the kubernetes cluster.


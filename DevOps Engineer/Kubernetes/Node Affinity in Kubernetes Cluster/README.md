#### Node Affinity in Kubernetes Cluster

The Nautilus DevOps team is doing some testing around the Kubernetes cluster for pods, deployments etc. A new ticket has been raised by one of the developer with some particular requirements. Find below more details and perform the task accordingly.


Create a label for node node01 color=black,

Based on the new label created for node01 using nodeAffinity matchExpressions create a new deployment named black, use image nginx with latest tag only and remember to mention tag i.e nginx:latest and 3 replicas; ensure container name is nginx-container and that it gets placed on the node01 node only. Also make sure all pods are in running state before clicking on FINISH.

Note: The kubectl utility on jump_host has been configured to work with the kubernetes cluster.

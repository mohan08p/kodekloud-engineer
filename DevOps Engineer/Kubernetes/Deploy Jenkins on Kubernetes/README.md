#### Deploy Jenkins on Kubernetes

The Nautilus DevOps team is planning to setup a Jenkins CI server to create/manage some deployment pipelines for some of the projects. They want to setup the Jenkins server on Kubernetes cluster. Below you can find more details about the task:


1) Create namespace jenkins

2) Create a Service for jenkins deployment. Service name should be jenkins-service under jenkins namespace, type should be NodePort, targetport should be 8080 and nodePort should be 30008

3) Create a Jenkins Deployment under jenkins namespace, It should be name as jenkins-deployment , labels app should be jenkins , container name should be jenkins-container , use jenkins image, containerPort should be 8080 and replicas count should be 1.

Make sure to wait for pods to be in running state before clicking on Finish button.

Note: The kubectl utility on jump_host has been configured to work with the kubernetes cluster.

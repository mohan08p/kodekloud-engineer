#### Deploy Tomcat App on Kubernetes

A new java based application is ready to be deployed on a Kubernetes cluster. Development team had some meeting with DevOps team share requirements and application scope. Team is ready to setup an application stack for same under their existing cluster. Below you can find the details for the same:

    Create a namespace named tomcat-namespace-xfusion.

    Create a deployment for tomcat app which should be named as tomcat-deployment-xfusion under the same namespace you created. Replicas count should be 1, the container should be named as tomcat-container-xfusion, its image should be gcr.io/kodekloud/centos-ssh-enabled:tomcat and its container port should be 8080.

    Create a service for tomcat app which should be named as tomcat-service-xfusion under the same namespace you created. Service type should be NodePort. port's protocol should be TCP, port should be 80, targetPort should be 8080 and nodePort should be 32227.

Before clicking on Finish button please make sure application is up and running.

You can use any labels as per your choice.

Note: The kubectl on jump_host has been configured to work with the kubernetes cluster.


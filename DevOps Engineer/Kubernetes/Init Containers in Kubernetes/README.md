#### Init Containers in Kubernetes

There are some applications that need to be deployed on Kubernetes cluster and these apps do have some pre-requisites where some configuration need to be changes before deploying the app container. Some of these changes can not be made inside the images so DevOps team has come up with a solution to use init containers to perform these tasks during deployment. Below is a sample scenario team is going to test first.


Create a Deployment named as ic-deploy-nautilus.

Configure spec as replicas should be 1, labels app should be ic-nautilus, template's metadata lables app should be same ic-nautilus.

The initContainers should be names as ic-msg-nautilus, use image fedora, preferably with latest tag and use command '/bin/bash', '-c' and 'echo Init Done - Welcome to xFusionCorp Industries > /ic/beta'. The volume mount should be named as ic-volume-nautilus and mount path should be /ic.

Main container should be named as ic-main-nautilus, use image fedora, preferably with latest tag and use command '/bin/bash', '-c' and 'while true; do cat /ic/beta; sleep 5; done'. The volume mount should be named as ic-volume-nautilus and mount path should be /ic.

Volume to be named as ic-volume-nautilus and it should be an emptyDir type.

Note: The kubectl utility on jump_host has been configured to work with the kubernetes cluster.

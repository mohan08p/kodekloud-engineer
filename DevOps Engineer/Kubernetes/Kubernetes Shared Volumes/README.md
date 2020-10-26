#### Kubernetes Shared Volumes

We are working on an application that will be deployed on multiple containers within a pod on Kubernetes cluster. There is a requirement to share a volume among the containers to save some temporary data. The Nautilus DevOps team is developing a similar template to replicate the scenario. Below you can find more details about it.

    Create a pod named volume-share-xfusion.

    For first container, use image fedora with latest tag only and remember to mention tag i.e fedora:latest, container should be named as volume-container-xfusion-1, and run a command '/bin/bash', '-c' and 'sleep 10000'. Volume volume-share should be mounted at path /tmp/blog.

    For second container, use image fedora with latest tag only and remember to mention tag i.e fedora:latest, container should be named as volume-container-xfusion-2, and run a command '/bin/bash', 'c' and 'sleep 10000'. Volume volume-share should be mounted at path /tmp/games.

    Volumes to be named as volume-share and use emptyDir: { }.

    After creating pods, exec into the first container volume-container-xfusion-1, and create a file blog.txt with content Welcome to xFusionCorp Industries! under the mount path of first container i.e /tmp/blog.

    The file blog.txt should be present under the mounted path /tmp/games of second container volume-container-xfusion-2 as they are using shared volumes.

Note: The kubectl utility on jump_host has been configured to work with the kubernetes cluster.

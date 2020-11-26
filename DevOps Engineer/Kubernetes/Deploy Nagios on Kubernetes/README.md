#### Deploy Nagios on Kubernetes

The Nautilus DevOps teams is planning to set up a Nagios monitoring tool to monitor some applications, services etc. They are planning to deploy it on Kubernetes cluster. Below you can find more details.


1) Create a deployment nagios-deployment for Nagios core. The container name must be nagios-container and it must use jasonrivers/nagios image.

2) Create a user and password for the Nagios core web interface, user must be xFusionCorp and password must be LQfKeWWxWD. (you can manually perform this step after deployment)

3) Create a service nagios-service for Nagios which must be of targetPort type. Port must be 80 and nodePort must be 30008.

You can use any labels as per your choice.

Note: The kubectl on jump_host has been configured to work with the kubernetes cluster.

#### Troubleshoot Deployment issues in Kubernetes

Last week the Nautilus DevOps team deployed an Redis app on Kubernetes cluster which was working fine so far. Today morning one of the team members was working on to make some changes in this existing setup but he made some mistakes and the app went down. We need to fix this as soon as possible. Please take a look.

The deployment name is redis-deployment and it contains a ConfigMap redis-config which should have nodeSelector as master only. Deployment is not in running state right now so please look into the issue and fix the same. Please do not remove or alter any other existing settings/configs.

Note: The kubectl utility on jump_host has been configured to work with the kubernetes cluster.

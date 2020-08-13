#### Kubernetes Time Check Pod

The Nautilus DevOps team want to create a time check pod in a particular Kubernetes namespace and record the logs. This might be initially used only for existing purposes, but later can be implemented in an existing cluster. Please find more details below about the task and perform it.


Create a pod called time-check in the datacenter namespace. This pod should run a container called time-check container should use the busybox image with latest tag only and remember to mention tag i.e busybox:latest.

Create a config map called time-config with the data TIME_FREQ=6 in the same namespace, and volume name should be log-volume.

The time-check container should run the command: while true; do date; sleep $TIME_FREQ;done and should write the result to the location /opt/dba/time/time-check.log.

3.The path /opt/dba/time on the pod should mount a volume that lasts the lifetime of this pod.

Note: The kubectl utility on jump_host has been configured to work with the kubernetes cluster.


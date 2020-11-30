#### Deploy Grafana on Kubernetes Cluster

The Nautilus DevOps teams is planning to set up a Grafana tool to collect and analyze analytics from some applications. They are planning to deploy it on Kubernetes cluster. Below you can find more details.


1.) Create a namespace for Grafana grafana-monitoring-datacenter.

2.) Create grafana-deployment-datacenter deployment the namespace you created.

a. Replica counts should be 1.

b. Container name should be grafana-container-datacenter and use grafana/grafana:latest image.

c. Container port should be 3000. Set resources limits memory to 2Gi and CPU to 1000m, requests for memory 1Gi and for CPU 500m.

d. Volume mount name should be grafana-storage. Its mountPath should be /var/lib/grafana. Volume name should be grafana-storage, should be emptyDir {}.

3.) Create grafana-service-datacenter service under the same namespace. It must be of NodePort type, its port must be 3000, target port must be 3000 and nodePort must be 32000.

You can use any labels as per your choice.

Note: The kubeclt on jump_host has been configured to work with kubernetes cluster.

#### Deploy Haproxy App on Kubernetes

The Nautilus project team needs to setup a HaProxy app on Kubernetes cluster. In the recent meeting they discussed all requirements and how implementation details will proceed. Below you can find more details and proceed accordingly:

    Create a namespace haproxy-controller-datacenter.

    Create a ServiceAccount haproxy-service-account-datacenter under the same namespace.

    Create a ClusterRole which should be named as haproxy-cluster-role-datacenter, rules are placed under location /tmp/rules.yml on jump_host. Use the content of file /tmp/rules.yml to configure ClusterRole.

    Create a ClusterRoleBinding which should be named as haproxy-cluster-role-binding-datacenter under the same namespace. Define roleRef apiGroup should be rbac.authorization.k8s.io, kind should be ClusterRole, name should be haproxy-cluster-role-datacenter and subjects kind should be ServiceAccount, name should be haproxy-service-account-datacenter and namespace should be haproxy-controller-datacenter.

    Create a backend deployment which should be named as backend-deployment-datacenter under the same namespace, labels run should be ingress-default-backend under metadata. Configure spec as replica should be 1, selector's matchLabels run should be ingress-default-backend. Template's labels run under metadata should be ingress-default-backend. The container should named as backend-container-datacenter, use image gcr.io/google_containers/defaultbackend:1.0 ( use exact name of image as mentioned ) and its containerPort should be 8080.

    Create a service for backend which should be named as service-backend-datacenter under the same namespace, labels run should be ingress-default-backend. Configure spec as selector's run should beingress-default-backend, port should be named as port-backend, protocol should be TCP, port should be 8080 and targetPort should be 8080.

    Create a deployment for frontend which should be named haproxy-ingress-datacenter under the same namespace. Configure spec as replica should be 1, selector's matchLabels should be haproxy-ingress, template's labels run should be haproxy-ingress under metadata. The container name should be ingress-container-datacenter under the same service account haproxy-service-account-datacenter, use image haproxytech/kubernetes-ingress, give args as --default-backend-service=haproxy-controller-datacenter/service-backend-datacenter, resources requests for cpu should be 500m and for memory should be 50Mi, livenessProbe httpGet path should be /healthz its port should be 1024. The first port name should be http and its containerPort should be 80, second port name should be https and its containerPort should be 443 and third port name should be stat its containerPort should be 1024. Define environment as first env name should be TZ its value should be Etc/UTC, second env name should be POD_NAME its valueFrom fieldRef fieldPath should be metadata.name and third env name should be POD_NAMESPACE its valueFrom fieldRef fieldPath should be metadata.namespace.

    Create a service for frontend which should be named as ingress-service-datacenter under same namespace, labels run should be haproxy-ingress. Configure spec as selectors' run should be haproxy-ingress, type should be NodePort. The first port name should be http, its port should be 80, protocol should be TCP, targetPort should be 80 and nodePort should be 32456. The second port name should be https, its port should be 443, protocol should be TCP, targetPort should be 443 and nodePort should be 32567. The third port name should be stat, its port should be 1024, protocol should be TCP, targetPort should be 1024 and nodePort should be 32678.

Note: The kubectl on jump_host has been configured to work with the kubernetes cluster.

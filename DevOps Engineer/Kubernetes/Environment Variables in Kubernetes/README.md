#### Environment Variables in Kubernetes

There are number of parameters that are used by applications which we need to define as environment variables so that we can use them as per our need within different configs. Below is a scenario which needs to be configured on Kubernetes cluster. Please find below more details about he same.

    Create a namespace named as fieldref-namespace.

    Create a pod named envars-fieldref under the namespace fieldref-namespace.

    Configure spec as the container name should be fieldref-container, use image nginx preferable latest tag, use command 'sh', '-c' and args should be

'while true; do echo -en '/n'; printenv NODE_NAME POD_NAME POD_NAMESPACE; printenv POD_IP POD_SERVICE_ACCOUNT; sleep 10; done;'

(Note: please take care of indentations)

    Define five environment variables as mentioned below:

a.) First env should be named as NODE_NAME, set valueFrom fieldref and fieldPath should be spec.nodeName.

b.) Second env should named as POD_NAME, set valueFrom fieldref and fieldPath should be metadata.name.

c.) Third env should named as POD_NAMESPACE, set valueFrom fieldref and fieldPath should be metadata.namespace.

d.) Forth env should named as POD_IP, set valueFrom fieldref and fieldPath should be status.podIP.

e.) Fifth env should named as POD_SERVICE_ACCOUNT, set valueFrom fieldref and fieldPath shoulbe be spec.serviceAccountName.

    Set restart policy to Never.

    To check the output, exec the pod and use printenv command.

Note: The kubectl utility on jump_host has been configured to work with the kubernetes cluster.


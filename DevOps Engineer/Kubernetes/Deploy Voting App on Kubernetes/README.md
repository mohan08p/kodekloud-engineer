#### Deploy Voting App on Kubernetes

The Nautilus DevOps team is running a voting app on their old infrastructure which they want to migrate to the Kubernetes cluster. They have already prepared the requirements related to the application stack. As per details given below deploy the voting app on the Kubernetes cluster:

    Create a namespace which should be named as vote.

    Create a service vote-service under the namespace you created. Port should be 5000, targetPort should be 80 and nodePort should be 31000. Service endpoint exposes deployment vote-deployment under namespace vote.

    Create a deployment vote-deployment under the namespace you created. Replicas count should be 1, the container name should be vote, use kodekloud/examplevotingapp_vote:before image ( use exact name of image as mentioned ) and containerPort should be 80.

    Create a service redis under the same namespace. Port should be 6379, targetPort should be 6379, its type should be ClusterIP service endpoint exposes deployment redis-deployment under namespace vote.

    Create a redis deployment redis-deployment under the same namespace. Repicas count should be 1. The container name should be redis use redis:alpine image ( use exact name as mentioned ). Volume type should be EmptyDir, volumeName should be redis-data and its mountPath should be /data

    Create a deployment worker under the same namespace. Its replicas count should be 1. The container name should be worker, use kodekloud/examplevotingapp_worker image ( use exact name of image as mentioned ).

    Create a service db under the same namespace. Port shold be 5432, targetPort should be 5432 and its type should be ClusterIP.

    Create a deployment db-deployment under the same namespace. Its replica count should be 1. The container name should be postgres, use postgres:9.4 image ( use exact name of image as mentioned ). Define ENV as first env name should be POSTGRES_USER its value should be postgres, second env name should be POSTGRES_PASSWORD its value should be postgres and third env name should be POSTGRES_HOST_AUTH_METHOD its value should be trust. Volume type should be EmptyDir, volumeName should be db-data and its mountPath should be /var/lib/postgresql/data.

    Create a deployment for result which should be named as result-deployment under the same namespace. Configure spec as replica should be 1. The container name should be result, use image kodekloud/examplevotingapp_result:before ( use exact name of image as mentioned ) and the containerPort should be 80.

    Create a service fo result which should be named as result-service under the same namespace. Configure spec as port should be 5001, targetPort should be 80 and nodePort should be 31001 and its type should be NodePort.

You can use any labels as per your choice.

Note: The kubectl on jump_host has been configured to work with the kubernetes cluster.

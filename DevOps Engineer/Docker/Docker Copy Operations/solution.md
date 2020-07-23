#### Docker Copy Operations

[Docker copy](https://docs.docker.com/engine/reference/commandline/cp/) operation is used to copy files/directories to and from the docker container to host machine. It's syntax is as shown below, 

    docker cp [OPTIONS] CONTAINER:SRC_PATH DEST_PATH|-
    docker cp [OPTIONS] SRC_PATH|- CONTAINER:DEST_PATH

SSH to app server 3 and copy a file `/tmp/nautilus.txt.gpg` inside the running container using the command,

    docker cp /tmp/nautilus.txt.gpg ubuntu_latest:/home/

Now SSH to that container and verify that the file has copied it correctly into /home directory using the following command,

    docker exec -it ubuntu_latest /bin/bash

    root@2774cdac33a6:/# ls -ltr

![List inside Docker container](/images/lsInsideContainer.JPG)

Thank you.

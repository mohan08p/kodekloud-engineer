#### Docker Volumes Mapping

SSH to App server1 and pull the ubuntu latest docker image using command,

    docker image pull ubuntu

Now run a container out of this docker image and name it as given in the problem statement, `media` and create volume and mapped it as shown in the following command,

    docker container run -dt --name media -v /opt/security:/home ubuntu

NOTE: We are passing an flag -t which is -tty=false which will allocate a pseudo-TTY.

Check as the container is in runnign state or not using the below command,

    [root@stapp01 tony]# docker container ps
    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
    fce34114322b        ubuntu              "/bin/bash"         7 seconds ago       Up 5 seconds                            media

Also, we can verify that the volumes are created and sample file is able see inside the container at the respective path, as shown below,

![Check the file inside Docker volume](/images/DockerVolume.JPG)

Thank you.

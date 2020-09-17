#### Save. Load and Transfer Docker Image

We have to archieve the docker image created on one server and copy it to another server and load the same docker image on it. Here, Docker `save` and `load` commands will be useful. The same will be applicable in real use case where there is no active internet connectivity and you want to run docker applications.

SSH to App server 1 and use the `docker save` command to image to a tar archive using the following command,

    docker save demo:xfusion > demo.tar

Then scp this .tar file on App server 3 using the command,


    scp demo.tar banner@172.16.238.12:~/
    ...
    scp demo.tar banner@172.16.238.12:~/The authenticity of host '172.16.238.12 (172.16.238.12)' can't be established.
    ECDSA key fingerprint is SHA256:3XvVrcIScewpi6bOStFAVT/c51OQnRcpHJ9zyj5tW5M.
    ECDSA key fingerprint is MD5:84:57:49:4a:d4:22:68:2b:8a:98:e6:eb:1a:8a:c9:64.
    Are you sure you want to continue connecting (yes/no)? yes
    Warning: Permanently added '172.16.238.12' (ECDSA) to the list of known hosts.
    banner@172.16.238.12's password:demo.tardemo.tar                                                    100%   94MB 109.7MB/s   00:00

Then SSH to App server 3 and check if demo.tar file is there or not using `ls -ltr` and once it's there use the `docker load` command to load an docker image from tar archive as shown below,

    docker load < demo.tar
    e1c75a5e0bfa: Loading layer [==================================================>]  75.22MB/75.22MB
    9e97312b63ff: Loading layer [==================================================>]  1.011MB/1.011MB
    ec1817c93e7c: Loading layer [==================================================>]  15.36kB/15.36kB
    05f3b67ed530: Loading layer [==================================================>]  3.072kB/3.072kB
    f31a96b3e18c: Loading layer [==================================================>]  22.26MB/22.26MB
    Loaded image: demo:xfusion
    
NOTE: If you get the following error, *Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?* then start a docker daemon service on the host using *service docker start*

Finally verify that the docker image ls there using ls command,

    [root@stapp03 banner]# docker image ls
    REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
    demo                xfusion             73194c889800        6 minutes ago       96.1MB

Thank you.

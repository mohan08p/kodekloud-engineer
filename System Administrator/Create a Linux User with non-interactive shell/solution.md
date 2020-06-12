#### Create a Linux User with non-interactive shell

Create a user `kirsty` with non-interactive shell using the following command,

    useradd -s /sbin/nologin kirsty

Validate that a user is created with non-interactive shell,

    [root@stapp03 banner]# tail -1 /etc/passwd
    kirsty:x:1002:1002::/home/kirsty:/sbin/nologin

Thanks.

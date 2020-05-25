#### Linux Firewalld Rules

Open port 8085 in public zone using the following command,

    firewall-cmd --zone=public --add-port=8085/tcp

Then, you can verify the same using the command,

    [root@stbkp01 clint]# sudo firewall-cmd --zone=public --list-ports
    8085/tcp


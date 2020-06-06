#### Linux Services

SSH to all app servers and run the following command to isntall httpd,

    yum -y install httpd

Once Apache web server installed, you can start it first time and enable it to start automatically at system boot.

    systemctl start httpd
    systemctl enable httpd
    systemctl status httpd

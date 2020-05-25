####  Linux Network Services 

1. SSH to all three applications servers.

2. Check the httpd service status, usign the command,

    service httpd status

   You'll find one or two server where httpd is not running or in stopped state.

3. As mentioned in the problem statement, the port should be 8089, then check all the open ports using a command,

    netstat -nlp

    Active Internet connections (only servers)Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
    tcp        0      0 127.0.0.11:33006        0.0.0.0:*               LISTEN      -
    tcp        0      0 0.0.0.0:111             0.0.0.0:*               LISTEN      1/init
    tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      104/sshd
    tcp        0      0 `127.0.0.1:8089`          0.0.0.0:*               LISTEN      257/sendmail: accep

4. As you can see in the output of the above command, port 8089 is already open and running an email service. So, we will stop/kill that email service and then start httpd service and check its status,

    kill -9 257 #forcefully killing
    service httpd start
    service httpd status

5. Now, check from the jump host and curl to all three app servers using below command,

    curl http://172.16.238.10:8089
    curl http://172.16.238.11:8089
    curl http://172.16.238.12:8089

   Again, you'll find that on App server one you will not get a response. Firewall is blocking the connections.

6. Disable fireawall rules using a command,

    iptables --flush

7. Finally, try again from the jump host and you will see it works.

Hope it helps. Thanks.

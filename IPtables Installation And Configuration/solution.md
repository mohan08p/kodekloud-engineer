####  IPtables Installation And Configuration 

1. Disable firewall service(If it's not installed escape this step)

   Before installing and using iptables services on CentOS and Red Hat 7 systems, we need to disable firewalld service. To completely disable firewalld service use following commands.

    sudo systemctl stop firewalld
    sudo systemctl mask firewalld
    sudo systemctl status firewalld

2. Now install iptables service using yum package manager using the     
   following command.

    sudo yum install iptables-services

   After installing enable iptables service and start using below commands.

    sudo systemctl enable iptables
    sudo systemctl start iptables

   And, check the status of a service,

    sudo systemctl status iptables
    chkconfig iptables on

3. To list the iptable rules just to check before applying mentioned rule,

    sudo systemctl status iptables

4. Then, as mentioned in the task, we need to allow port 8088 only from LBR server, use the following command(execute on all three app servers),

    iptables -A INPUT -p tcp --dport 8088 -s 172.16.238.14 -j ACCEPT

5. Finally, persist these rules to take effect after reboot, use the below save command, 

    service iptables save

6. Validate the rule is created in listing, 

    /sbin/iptables -L -n -v
    or 
    iptables -L

   You will see the rule has created for this respective entry.

Hope it helps. Thanks.
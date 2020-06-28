#### Linux Firewalld Setup

SSH to all three app servers and check the respective ports on which Apache and Nginx services are running and note down the port numbers respectively. 
In my scenario, nginx is running on port 8099 and apache using port 8080.

To install firewalld on all app serers using a command,

    yum -y install firewalld

Start and enable a service at boot time using commands,

    systemctl start firewalld
    systemctl enable firewalld

Now allow all incoming connections to Nginx port using the command,

    firewall-cmd --zone=public --add-port=8099/tcp --permanent

Now, allow Apache port only from LBR host using the command,

    firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="176.16.238.14/32" port protocol="tcp" port="8080" accept'

After any firewall rules change, a reload is needed:

    firewall-cmd --reload

List all the ports from public zone using the command,

    firewall-cmd --zone=public --list-ports

To test the new rule you can use telnet command from the source address on these respective ports we used in the aobve commands. That will verify if rule is applied or not.

Also if want to see or edit directly the configuration file you can do it directly by running the following command:

    vi /etc/firewalld/zones/public.xml

Here, you can validate the entries of rule are correct as we applied above.

NOTE: This solution did not pass when I submit. 

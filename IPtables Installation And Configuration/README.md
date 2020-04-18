 #### IPtables Installation And Configuration 

 We have one of our website up and running on our Nautilus infrastructure in Stratos DC. Our security team has raised a concern that right now Apache’s port i.e 3004 is open for all since there is no firewall installed on these hosts. So we have decided to add some security layer for these hosts and after discussions and recommendations we have come up with below given requirements:

    Install iptables and all its dependencies on each app host.

    Block incoming port 8088 on all apps for everyone except for LBR host.

    Make sure the rules should persist even after system reboot.

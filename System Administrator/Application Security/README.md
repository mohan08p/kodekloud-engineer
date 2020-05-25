#### Application Security

We are having a backup management application UI hosted on Nautilus's backup server in Stratos DC. That backup management application code is deployed under Apache on backup server itself and Nginx is running as a reverse proxy on same server. Apache and Nginx ports are 8085 and 8098 respectively. We have iptables firewall installed on this server. Make the appropriate changes to fulfill the requirements mentioned below:

We want to open all incoming connections to Nginx's port and want to block all incoming connections to Apache's port. Also make sure rules are permanent.
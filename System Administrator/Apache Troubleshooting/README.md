####  Apache Troubleshooting 

xFusionCorp Industries having some monitoring tools to check the status of every service, applications etc running on the systems. So, the monitoring system acknowledged that Apache service is not running on some of the Nautilus Application Servers in Stratos Datacenter.

    Identify the faulty Nautilus Application Servers and fix the issue. And also make sure Apache service is up and running on all Nautilus Application Servers, do not try to stop any kind of firewall if already running.

    Apache is running on 8088 port on all Nautilus Application Servers and it document root must be /var/www/html on all app servers.

    Finally you can test from jump host using curl command to access Apache on all app servers and it should work fine. e.g curl http://172.16.238.10:8088/

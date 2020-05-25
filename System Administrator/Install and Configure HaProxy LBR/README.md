####  Install and Configure HaProxy LBR 

There is a static website of Nautilus project running in Stratos Datacenter. Based on the infrastructure they have already configured app servers and code is already deployed over there. To make it work properly they need to configure LBR server. There are number of options for that but team has decided to go with HAproxy.

a. So install and configure HAproxy on LBR server using yum only and make sure all app servers are added to HAproxy load balancer. HAproxy must serve on default http port (Note: Please do not remove stats socket /var/lib/haproxy/stats entry from haproxy default config.).

b. You can access the website on LBR link, to do so click on the + button on top of your terminal and select option Select port to view on Host 1 and after adding port 80 click on Display Port.


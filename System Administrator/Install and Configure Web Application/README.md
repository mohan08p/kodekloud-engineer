#### Install and Configure Web Application

xFusionCorp Industries planning to host two static websites on their infra in Stratos Datacenter. The development of these websites is still in-progress but we want to get the servers ready. The storage server has a shared directory /data that is mounted on each app host under /var/www/html directory. Please perform below given steps to accomplish the task:


a. Install httpd package and dependencies on all app hosts.

b. Apache should serve on port 8080 within the apps.

c. There are two website's backups /home/thor/news and /home/thor/blog on jump_host. Setup them on Apache in a way that news should work on link http://<<lb-url>>/news/ and blog should work on link http://<<lb-url>>/blog. (do not worry about load balancer configuration, its already configured)

d. You can access the website on LBR link, to do so click on the + button on top of your terminal and select option Select port to view on Host 1 and after adding port 80 click on Display Port.

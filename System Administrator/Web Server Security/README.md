#### Web Server Security

During recent security audit, application security team of xFusionCorp Industries found some security issues with Apache web server on Nautilus App Server 2 server in Stratos DC. They have listed out some security issues that need to be fixed on this server. Please apply the below mentioned security settings:


a. On Nautilus App Server 2 it was identified that Apache web server is exposing the version number. Make appropriate settings on this server to hide the version number of Apache web server.

b. There is a website hosted under /var/www/html/news on App Server 2. It was detected that the directory /news is listing all of its contents while browsing the URL. Disable directory browser listing in Apache config.

c. Also make sure to restart Apache service after making the changes.

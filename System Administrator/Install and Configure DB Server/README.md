####  Install and Configure DB Server 

We recently migrated one of our WordPress website from old server to a new infrastructure in Stratos Datacenter. We have already setup LAMP except database. We have also restored website code however we need to restore database to make it work on new infra. Please perform the below given steps on DB host:

a. Install/Configure MariaDB server.

b. Create a database with name kodekloud_db2.

c. There is a DB dump on jump_host under location /home/thor/db.sql. Restore this database in newly create database.

d. Create a user kodekloud_cap and set any password you like.

e. Grant full permissions to user kodekloud_cap on database kodekloud_db2.

f. Update database related details in /data/wp-config.php file on storage server which is our NFS server having a share /data that is mounted on each app server on location /var/www/html. (for more details about how to update WordPress config file please visit https://wordpress.org/support/article/editing-wp-config-php/)

g. You can access the website on LBR link, to do so click on the + button on top of your terminal and select option Select port to view on Host 1 and after adding port 80 click on Display Port.

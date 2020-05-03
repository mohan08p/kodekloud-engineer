####  Install and Configure DB Server 

1. MariaDB is a free and open source fork of well known MySQL database management server software, developed by the brains behind MySQL, it’s envisioned to remain free/open source.

Add MariaDB Yum Repository, vi /etc/yum.repos.d/MariaDB.repo, add below content,

    [mariadb]
    name = MariaDB
    baseurl = http://yum.mariadb.org/10.1/centos7-amd64
    gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
    gpgcheck=1

2. Install MariaDB in CentOS 7

    yum install MariaDB-server MariaDB-client -y

3. As soon as the installation of MariaDB packages completes, start the database server daemon for the time being, and also enable it to start automatically at the next boot like so:

    systemctl start mariadb
    systemctl enable mariadb
    systemctl status mariadb

4. Now its time to secure your MariaDB by setting root password, disabling remote root login, removing the test database as well as anonymous users and finally reload privileges as shown in the screen shot below:

Secure MariaDB in CentOS 7

    mysql_secure_installation

5. After securing the database server, you may want to check certain MariaDB features such as: installed version, default program argument list, and also login to the MariaDB command shell as follows:

    mysql -V
    mysqld --print-defaults
    mysql -u root -p

6. Then, as mentioned create a database, named, kodekloud_db2

    CREATE DATABASE kodekloud_db2;
    SHOW DATABASES;

7. Create a user kodekloud_cap and set any password you like and grant full permissions to user kodekloud_cap on database kodekloud_db2.

    CREATE USER 'kodekloud_cap'@'localhost' IDENTIFIED BY 'conti@123';
    GRANT ALL PRIVILEGES ON kodekloud_db2.* TO 'kodekloud_cap'@'localhost';

   Verify that user got the necessary permissions,

    SHOW GRANTS for 'kodekloud_cap'@'localhost';

8. If you run any command on the MySQL/MariaDB server you must run the below command each time. All changes will take effect once you run the command below.

   Flush Privileges
    
    FLUSH PRIVILEGES;

9. There is a DB dump on jump_host under location /home/thor/db.sql. Restore this database in newly create database. Use scp or simply copt and paste of scp did not work.

    scp /home/thor/db.sql peter@172.16.239.10:~/

10. Restore the database from the above `db.sql` file,

    mysql -u kodekloud_cap -p kodekloud_db2 < db.sql

11. SSH to storage server and updade the database details in a config file `/data/wp-config.php`,

    vi /data/wp-config.php


    ** The name of the database for WordPress */
    define( 'DB_NAME', 'kodekloud_db2' );

    /** MySQL database username */
    define( 'DB_USER', 'root' );

    /** MySQL database password */
    define( 'DB_PASSWORD', 'conti@123' );

    /** MySQL hostname */
    define( 'DB_HOST', '172.16.239.10' );

12. Finally, verify that if you able to view the frontend on port 80 of Host 1. 

    




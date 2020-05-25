####  Install and Configure DB Server 

MariaDB is a free and open source fork of well known MySQL database management server software, developed by the brains behind MySQL, it’s envisioned to remain free/open source.

Add MariaDB Yum Repository, vi /etc/yum.repos.d/MariaDB.repo, add below content,

    sudo tee /etc/yum.repos.d/MariaDB.repo<<EOF 
    [mariadb]
    name = MariaDB
    baseurl = http://yum.mariadb.org/10.4/centos7-amd64
    gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
    gpgcheck=1
    EOF

Update yum cache index,

    sudo yum makecache fast

Install MariaDB in CentOS 7,

    sudo yum -y install MariaDB-server MariaDB-client

Start and enable mariadb service,

    sudo systemctl enable --now mariadb

Now its time to secure your MariaDB by setting root password, disabling remote root login, removing the test database as well as anonymous users and finally reload privileges as shown in the screen shot below:

   Secure MariaDB in CentOS 7

    mysql_secure_installation

After securing the database server, you may want to check certain MariaDB features such as: installed version, default program argument list, and also login to the MariaDB command shell as follows:

    mysql -V
    mysqld --print-defaults
    mysql -u root -p

Then, as mentioned create a database, named, kodekloud_db2

    CREATE DATABASE kodekloud_db2;
    SHOW DATABASES;

Create a user kodekloud_cap and set any password you like and grant full permissions to user kodekloud_cap on database kodekloud_db2.

    CREATE USER 'kodekloud_cap'@localhost IDENTIFIED BY 'password';
    GRANT ALL PRIVILEGES ON kodekloud_db2.* TO 'kodekloud_cap'@'localhost';

   Verify that user got the necessary permissions,

    SHOW GRANTS for 'kodekloud_cap'@'localhost';

If you run any command on the MySQL/MariaDB server you must run the below command each time. All changes will take effect once you run the command below.

   Flush Privileges
    
    FLUSH PRIVILEGES;

There is a DB dump on jump_host under location /home/thor/db.sql. Restore this database in newly create database. Use scp or simply copt and paste of scp did not work.

    scp /home/thor/db.sql peter@172.16.239.10:~/

Restore the database from the above `db.sql` file,

    mysql -u kodekloud_cap -p kodekloud_db2 < db.sql

SSH to storage server and updade the database details in a config file `/data/wp-config.php`,

    vi /data/wp-config.php


    ** The name of the database for WordPress */
    define( 'DB_NAME', 'kodekloud_db2' );

    /** MySQL database username */
    define( 'DB_USER', 'kodekloud_cap' );

    /** MySQL database password */
    define( 'DB_PASSWORD', 'password' );

    /** MySQL hostname */
    define( 'DB_HOST', '172.16.239.10' );

Finally, verify that if you able to view the frontend on port 80 of Host 1. The page is not properly visible as css are not getting loaded with this application. If you see KodeKloud blog you can consider the database is configured correctly. And, in case if you see database connection error which means something is not correct while congfiguring the database.

Hope this helps. Thanks.

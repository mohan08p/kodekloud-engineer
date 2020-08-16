#### Deploy an App on Docker Containers

1. SSH to App server 1 and change directory to `/opt/finance/` and create a docker compose file,

```
[root@stapp01 tony]# cd /opt/finance/
[root@stapp01 finance]# vi docker-compose.yml

Refer same directoy for the *docker-compose.yml file*
```

2. Now run an aaplication using docker compose,

```
[root@stapp01 finance]# docker-compose up
...
...
mysql_apache | 2020-08-16  7:49:55 0 [Note] mysqld: ready for connections.
mysql_apache | Version: '10.5.5-MariaDB-1:10.5.5+maria~focal'  socket: '/run/mysqld/mysqld.sock'  port: 3306  mariadb.org binary distribution
php_apache | AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 172.18.0.3. Set the 'ServerName' directive globally to suppress this message
php_apache | AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 172.18.0.3. Set the 'ServerName' directive globally to suppress this message
php_apache | [Sun Aug 16 07:50:00.280473 2020] [mpm_prefork:notice] [pid 1] AH00163: Apache/2.4.25 (Debian) PHP/7.3.21 configured -- resuming normal operations
php_apache | [Sun Aug 16 07:50:00.280869 2020] [core:notice] [pid 1] AH00094: Command line: 'apache2 -D FOREGROUND'
```

Yuo will see as above that will confirmed that container is up and running fine,

3. Finally curl from jump host or on app sever1 as localhost,

```
thor@jump_host /$ curl 172.16.238.10:8083
<html>
    <head>
        <title>Welcome to xFusionCorp Industries!</title>
    </head>

    <body>
        Welcome to xFusionCorp Industries!    </body>
```

Thank you.

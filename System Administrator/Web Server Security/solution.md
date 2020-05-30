#### Web Server Security

Make a local curl call to the server as shown below,

    curl http://localhost:8080/news/

You will see here that directories are listing which we need to block in this task.

When remote requests are sent to your Apache web server, by default, some valuable information such as the web server version number, server operating system details, installed Apache modules plus more, is sent along in server-generated documents back to the client.

To hide web server version number, server operating system details, installed Apache modules and more, open your Apache web server configuration file using your favorite editor and And add/modify/append the lines below:


    vi /etc/httpd/conf/httpd.conf

    ServerTokens Prod
    ServerSignature Off

Next, our task is to disable or prevent directory listing of your Apache web server using .htaccess file.

First open the above config file again and update value of AllowOverride  to the AlloOverrite All as shown below,

    vi /etc/httpd/conf/httpd.conf

    <Directory /var/www/html/>
       Options Indexes FollowSymLinks
       AllowOverride All
    </Directory>

Then make a backup of .htaccess file in /var/www/html/ for reference.

Finally edit `.htaccess` file and add below line to turn off Apache directory listing,

    Options -Indexes

Then restart the Apache web server,

    systemctl restart httpd

Make a local curl call to the server as shown below,

    curl http://localhost:8080/news/

You will see 403 Forbidden error which we can say that we have disable the directory listing successfully.

Hope it helps. Thanks.


   

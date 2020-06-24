#### Install and Configure Web Application

Copy the respective files for applications like /blog and /news to the storage server in /data directory. 

Zip the files and scp to the server and unzip to /data location.

Then ssh to all three app server to install and configure httpd.

Install httpd on the server using,

    yum install httpd -y

Change the listen port to 8080 of httpd service as mentioend into step 2 in problem statement.

    vi /etc/httpd/conf/httpd.conf
    ...
    Listen 8080
    ...

Once Apache web server installed, you can start it first time and enable it to start automatically at system boot.

    systemctl start httpd
    systemctl enable httpd
    systemctl status httpd

Then go to directory `/etc/httpd/conf.d` and configure both sites as give below,

   **blog.conf**

    NameVirtualHost *:8080

    <VirtualHost *:8080/blog>
        ServerAdmin mohanpawary1990@gmail.com
        ServerName stapp01.stratos.xfusioncorp.com
        ServerAlias www.stapp01.stratos.xfusioncorp.com
        DocumentRoot /var/www/html/blog/
        ErrorLog /var/log/httpd/blog/error.log
        CustomLog /var/log/httpd/blog/access.log combined
    </VirtualHost>

   **news.conf**

    NameVirtualHost *:8080

    <VirtualHost *:8080/news>
        ServerAdmin mohanpawary1990@gmail.com
        ServerName stapp01.stratos.xfusioncorp.com
        ServerAlias www.stapp01.stratos.xfusioncorp.com
        DocumentRoot /var/www/html/news/
        ErrorLog /var/log/httpd/news/error.log
        CustomLog /var/log/httpd/news/access.log combined
    </VirtualHost>

Make sure those directories are creates for log files. Then restart httpd service,

    systemctl restart httpd

Finally test the application locally first on app servers.

    curl localhost:8080/blog/
    curl localhost:8080/news/

Once, it's verified then check on LB url it should work as expected as well as validate the logs files as mentioned in the above config are geetting generated fine.

Hope it helps. Thank you.


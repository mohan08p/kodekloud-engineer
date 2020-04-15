#### Configure protected directories in Apache	

*NOTE: This lab I did not pass as something wrong I am doing in here. The final step is not validated.*

1. First, check if apache service is running or not, start if it's not running(as validate the port number on which service is running),

    service httpd status
    service httpd start

2. Copy index.html file from jump box to application server using scp,

    scp /tmp/index.html steve@172.16.238.11:~/

    Enter password and you can see file is transfer to the server.

3. Then, as mentioend in the first step, create a directory `/var/www/html/security`,

    mkdir /var/www/html/security

4. Create a user james as mentioned in step, and assign it a passwrd as give,

    adduser james

5. Validate or add apache document directory root for `/var/www/html/security` and add the following things as suggested, in case added, restart the httpd service,

    <Directory /var/www/html/security> 
    Options Indexes Includes FollowSymLinks MultiViews 
    AllowOverride All 
    Require all granted 
    </Directory>

6. We will create a password file that we can keep out of Apache’s web accessible directory so that it is well protected. For that purpose, we will create new directory:

    mkdir /home/james

7. After that we will generate our username and password that will be stored in that directory:

    htpasswd -c /home/james/webpass james

8. Then we will need to make sure that Apache is able to read the “webpass” file. For that purpose, you will need to change the ownership of that file with the following command:

    chown apache: /home/james/webpass
    chmod 640 /home/james/webpass

9. At this point our new user and password are ready. Now we need to tell Apache to request password when accessing our targeted directory. For that purpose, create file called .htaccess in /var/www/html:

    vi /var/www/html/security/.htaccess
    
    AuthType Basic
    AuthName "Restricted Access"
    AuthUserFile /home/james/webpass
    Require user james

10. Finally, test using curl api request,

    curl -u james http://localhost:8080/security/

    Here, I get 500 Internal server error response from the system.

Thanks.

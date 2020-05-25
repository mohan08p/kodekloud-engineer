#### Configure protected directories in Apache	

First, check if apache service is running or not, start if it's not running(as validate the port number on which service is running),

    service httpd status
    service httpd start

Copy index.html file from jump box to application server using scp,

    scp /tmp/index.html steve@172.16.238.11:~/

Enter password and you can see file is transfer to the server.

Then, as mentioend in the first step, create a directory `/var/www/html/security`,

    mkdir /var/www/html/security
    
Copy or move index.html file into document's root directory,

    cp /home/steve/index.html /var/www/html/security/

Validate or add apache document directory root for `/var/www/html/security` and add the following things as suggested, in case added, restart the httpd service,

    <Directory /var/www>
    Options Indexes Includes FollowSymLinks MultiViews
    AllowOverride AuthConfig
    Order allow,deny
    Allow from all
    </Directory>
    
Save the file and restart Apache,   
   
    service httpd restart

We will create a password file that we can keep out of Apache’s web accessible directory so that it is well protected. For that purpose, we will create new directory:

    mkdir -p /home/secure/

After that we will generate our username and password that will be stored in that directory:

    htpasswd -c /home/secure/apasswords james

Then we will need to make sure that Apache is able to read the “webpass” file. For that purpose, you will need to change the ownership of that file with the following command:

    chown apache:apache /home/secure/apasswords
    chmod 0660          /home/secure/apasswords

At this point our new user and password are ready. Now we need to tell Apache to request password when accessing our targeted directory. For that purpose, create file called .htaccess in /var/www/html:

    vi /var/www/html/security/.htaccess
    
    AuthType Basic
    AuthName "Restricted Access"
    AuthUserFile /home/secure/apasswords
    Require user james

Finally, test using curl api request and make sure to pass username and password when it prompts for it,

    root@stapp02 security]# curl -u james http://localhost:8080/security/
    Enter host password for user 'james':
    This is xFusionCorp Industries Protected Directory!.

Thanks. Hope it helps.

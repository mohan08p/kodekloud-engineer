#### Configure protected directories in Apache

xFusionCorp Industries has hosted some static websites on Nautilus Application Servers in Stratos DC. There are some confidential directories on document root that need to be password protected. Since they are using Apache for hosting the websites so production support team has decided to use .htaccess with basic auth. There is a website needs to be uploaded to /var/www/html/security on Nautilus App Server 2. But before that we need to setup the authentication.


Create /var/www/html/security direcotry if doesn't exist.

Add an user james in htpasswd and set its password to B4zNgHA7Ya.

There is a file /tmp/index.html placed on Jump Server. Copy the same to new directory you created, please make sure default document root should remain /var/www/html.
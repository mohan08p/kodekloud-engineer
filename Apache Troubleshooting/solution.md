####  Apache Troubleshooting 

Check the service status file and in that it will show ecaxtly what is causing the service to failed while starting.

Like remove double quotes from below line,
Listen 8088

Remove semicolon from DocumentRoot directory specified.

Remove those syntax errors from the httpd.conf file and you are good to go.

For velidating just check you config file is correct by following command,

    httpd -t
    or
    apachectl configtest

Thanks.
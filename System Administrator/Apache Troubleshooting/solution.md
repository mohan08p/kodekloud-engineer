####  Apache Troubleshooting 

Check the service status file and in that it will show ecaxtly what is causing the service to failed while starting(Issue might be on one or two app servers).

Like remove double quotes from below line,
    Listen 8088

Remove semicolon from DocumentRoot directory specified.

Remove those syntax errors from the httpd.conf file and you are good to go.

And, chceck the Listen port into configuration file, if it's different, change it appropriately. 

For velidating just check you config file is correct by following command,

    httpd -t
    or
    apachectl configtest

Then restart httpd service on failed server and validate from jump server you able to get a response on all app servers or not as shown below. Once, this is validated, you can mark it as complete.

    thor@jump_host /$ curl http://172.16.238.12:8085
    Welcome to xFusionCorp Industries !
    thor@jump_host /$ curl http://172.16.238.10:8085Welcome to xFusionCorp Industries !
    thor@jump_host /$ curl http://172.16.238.11:8085Welcome to xFusionCorp Industries !
    thor@jump_host /$

Thanks.

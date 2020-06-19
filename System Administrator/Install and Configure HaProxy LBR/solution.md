####  Install and Configure HaProxy LBR 

SSH to LBR server and install haproxy usign the folowing command,

     yum -y install haproxy openssl-devel

Login to any one of App server and check the port number on which apache service(httpd) is listening and curl to that port locally from that App server. Check in a file, `/etc/httpd/conf/httpd.conf`

    Listen 5003

    ...

    [root@stapp01 conf]# curl localhost:5003
    Welcome to xFusionCorp Industries !

Validate the configuration of Haproxy on LBR server, vi /etc/haproxy/haproxy.conf and, make sure you have the following configuration,

    frontend main
        bind *:80
        option http-server-close
        option forwardfor
        default_backend app-main

    backend app-main
        balance roundrobin
        option httpchk HEAD / HTTP/1.1\r\nHost:\ localhost
        server  stapp01 172.16.238.10:5003 check
        server  stapp02 172.16.238.11:5003 check
        server  stapp03 172.16.238.12:5003 check

Once it's validated, restart a haproxy service and do curl call on LBR server locally,

    [root@stlb01 loki]# curl localhost
    Welcome to xFusionCorp Industries !

Finally, once it's running fine, validate it on LBR link, by visiting your terminal and select option Select port to view on Host 1 and after adding port 80 click on Display Port. It should work as expected.

Thanks

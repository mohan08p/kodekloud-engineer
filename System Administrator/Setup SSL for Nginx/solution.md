#### Setup SSL for Nginx

1. First start by installing the Nginx package from the official repositories using your package manager,

    sudo yum update -y
    sudo yum install epel-release -y
    sudo yum install nginx -y

2. Once nginx package is installed, you need to start the service for now, enable it to auto-start at boot time and view it’s status, using the following commands,

    sudo systemctl start nginx
    sudo systemctl enable nginx
    sudo systemctl status nginx

3. As we have to configure SSL, we need to enable port 443 for this, go into main nginx config file `/etc/nginx/nginx.conf` and remove comment of server section of https as shown below along with change a certificate file from server to nautilus,

    server {
        listen       443 ssl http2 default_server;
        listen       [::]:443 ssl http2 default_server;
        server_name  _;
        root         /usr/share/nginx/html;

        ssl_certificate "/etc/pki/nginx/nautilus.crt";
        ssl_certificate_key "/etc/pki/nginx/private/nautilus.key";
        ...
        ...

        ...
        ...
    }

4. As can be seen in above server section we need to keep the respective SSL files to that respective directory. So, create those directories if not present,
    mkdir /etc/pki/nginx
    mkdir /etc/pki/nginx/private

5. The certificate files are already provided in /tmp directory, copy those certificate files to those location,

    cp /tmp/nautilus.crt /etc/pki/nginx/
    cp /tmp/nautilus.key /etc/pki/nginx/private/

6. Then create an index.html file in nginx root directory and insert a srting as given in problem statement, 

    echo "Welcome!" > /usr/share/nginx/html/index.html

7. Test if your nginx configuration file is correct using below command,

    nginx -c /etc/nginx/nginx.conf -t

8. Finally, restart a nginx service,

    service nginx restart

9. Test locally if you get a response on port 443,

    curl https://localhost/

10. At the end, verify the same from jump server,

    thor@jump_host /$ curl -Ik https://172.16.238.10/
    HTTP/1.1 200 OK
    Server: nginx/1.16.1Date: Sat, 18 Apr 2020 14:05:40 GMT
    Content-Type: text/html
    Content-Length: 9
    Last-Modified: Sat, 18 Apr 2020 14:01:38 GMT
    Connection: keep-alive
    ETag: "5e9b0842-9"
    Accept-Ranges: bytes

Hope it helps. Thanks.
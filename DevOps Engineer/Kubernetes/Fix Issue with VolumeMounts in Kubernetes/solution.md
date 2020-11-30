#### Fix Issue with VolumeMounts in Kubernetes

1. Change directory to `/home/thor` on jump server,

```
thor@jump_host /$ cd /home/thor/
```

2. Use alias k as kubectl utility,

```
thor@jump_host ~$ alias k='kubectl'
```

3. Check the pod status,

```
thor@jump_host ~$ k get pods
NAME           READY   STATUS    RESTARTS   AGE
nginx-phpfpm   2/2     Running   0          63s
```

4. Check the configmap,

```
thor@jump_host ~$ k get cm
NAME           DATA   AGE
nginx-config   1      68s
```

5. Check the root directory path in configmap, note path is `/var/www/html` in configmap.

```
thor@jump_host ~$ k describe cm nginx-config
Name:         nginx-config
Namespace:    default
Labels:       <none>
Annotations:  <none>

Data
====
nginx.conf:
----
events {
}
http {
  server {    listen 8099 default_server;
    listen [::]:8099 default_server;

    # Set nginx to serve files from the shared volume!
    root /var/www/html;
    index  index.html index.htm index.php;
    server_name _;
    location / {
      try_files $uri $uri/ =404;
    }
    location ~ \.php$ {
      include fastcgi_params;
      fastcgi_param REQUEST_METHOD $request_method;
      fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
      fastcgi_pass 127.0.0.1:9000;
    }
  }
}
```

6. Now, check the mount path in a pod and edit the mountPath in the pod.yaml file to `/var/www/html`

```
thor@jump_host ~$ k get pod nginx-phpfpm -o yaml > pod.yaml

Change mount path from /usr/share/nginx/html to /var/www/html
```

7. Then delete and create a pod again,

```
thor@jump_host ~$ k delete pod nginx-phpfpm
pod/nginx-phpfpm deleted

thor@jump_host ~$ k get pods
NAME           READY   STATUS    RESTARTS   AGE
nginx-phpfpm   2/2     Running   0          7s
```

8. Now, get a shell inside the container and check first if you able to get any response from nginx server, we can see 403 forbideen error,

```
thor@jump_host ~$ k exec nginx-phpfpm -c nginx-container -it /bin/bash
kubectl exec [POD] [COMMAND] is DEPRECATED and will be removed in a future version. Use kubectl exec [POD] -- [COMMAND] instead.

root@nginx-phpfpm:/# cd /var/www/html/

root@nginx-phpfpm:/var/www/html# curl localhost:8099
<html>
<head><title>403 Forbidden</title></head>
<body>
<center><h1>403 Forbidden</h1></center>
<hr><center>nginx/1.19.5</center>
</body>
</html>
```

9. Now, copy `index.php` from jump_host to container,

```
root@nginx-phpfpm:/var/www/html# echo "<?php phpinfo(); ?>" > index.php
```

10 Now, check the response from nginx web server,

```
root@nginx-phpfpm:/var/www/html# curl localhost:8099
...
...
...
tr class="h"><th>PHP Quality Assurance Team</th></tr>
<tr><td class="e">Ilia Alshanetsky, Joerg Behrens, Antony Dovgal, Stefan Esser, Moriyoshi Koizumi, Magnus Maatta, Sebastian Nohn, Derick Rethans, Melvyn Sopacua, Jani Taskinen, Pierre-Alain Joye, Dmitry Stogov, Felipe Pena, David Soria Parra, Stanislav Malyshev, Julien Pauli, Stephen Zarkos, Anatol Belski, Remi Collet, Ferenc Kovacs </td></tr>
</table>
<table>
<tr class="h"><th colspan="2">Websites and Infrastructure team</th></tr>
<tr><td class="e">PHP Websites Team </td><td class="v">Rasmus Lerdorf, Hannes Magnusson, Philip Olson, Lukas Kahwe Smith, Pierre-Alain Joye, Kalle Sommer Nielsen, Peter Cowburn, Adam Harvey, Ferenc Kovacs, Levi Morrison </td></tr>
<tr><td class="e">Event Maintainers </td><td class="v">Damien Seguy, Daniel P. Brown </td></tr>
<tr><td class="e">Network Infrastructure </td><td class="v">Daniel P. Brown </td></tr>
<tr><td class="e">Windows Infrastructure </td><td class="v">Alex Schoenmaker </td></tr>
</table>
<h2>PHP License</h2>
<table>
<tr class="v"><td>
<p>
This program is free software; you can redistribute it and/or modify it under the terms of the PHP License as published by the PHP Group and included in the distribution in the file:  LICENSE
</p>
<p>This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
</p>
<p>If you did not receive a copy of the PHP license, or have any questions about PHP licensing, please contact license@php.net.
</p>
</td></tr>
</table>
</div></body></html>
```

Thank you.

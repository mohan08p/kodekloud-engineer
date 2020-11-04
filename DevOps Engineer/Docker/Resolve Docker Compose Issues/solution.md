#### Resolve Docker Compose Issues

1. SSH to App server3 and change directory to `/opt/docker`, also, check it's content,

```
[root@stapp03 banner]# cd /opt/docker/

[root@stapp03 docker]# ls -ltr
total 16
-rw-r--r-- 1 root root  11 Nov  4 19:13 requirements.txt
-rw-r--r-- 1 root root  95 Nov  4 19:13 Dockerfile
-rw-r--r-- 1 root root 257 Nov  4 19:13 docker-compose.yml
-rw-r--r-- 1 root root 339 Nov  4 19:13 app.py
```

2. Now, check and validate the `docker-compose.yml` file,

```
[root@stapp03 docker]# vi docker-compose.yml
```
*Note: Check current directory for final config*

3. Now, use compose up to run the application,

```
[root@stapp03 docker]# docker-compose up
Creating network "docker_default" with the default driver
Pulling redis (redis:)...
latest: Pulling from library/redis
bb79b6b2107f: Pull complete
1ed3521a5dcb: Pull complete
5999b99cee8f: Pull complete
...
...
Successfully built 20f48ec1d054
Successfully tagged docker_web:latest
WARNING: Image for service web was built because it did not already exist. To rebuild this image you must use `docker-compose build` or `docker-compose up --build`.
Creating redis ... done
Creating python ... done
Attaching to redis, python
redis    | 1:C 04 Nov 2020 19:20:36.459 # oO0OoO0OoO0Oo Redis is starting oO0OoO0OoO0Oo
redis    | 1:C 04 Nov 2020 19:20:36.460 # Redis version=6.0.9, bits=64, commit=00000000, modified=0, pid=1, just started
redis    | 1:C 04 Nov 2020 19:20:36.460 # Warning: no config file specified, using the default config. In order to specify a config file use redis-server /path/to/redis.conf
redis    | 1:M 04 Nov 2020 19:20:36.461 * Running mode=standalone, port=6379.
redis    | 1:M 04 Nov 2020 19:20:36.461 # WARNING: The TCP backlog setting of 511 cannot be enforced because /proc/sys/net/core/somaxconn is set to the lower value of 128.
redis    | 1:M 04 Nov 2020 19:20:36.461 # Server initialized
redis    | 1:M 04 Nov 2020 19:20:36.461 # WARNING overcommit_memory is set to 0! Background save may fail under low memory condition. To fix this issue add 'vm.overcommit_memory = 1' to /etc/sysctl.conf and then reboot or run the command 'sysctl vm.overcommit_memory=1' for this to take effect.
redis    | 1:M 04 Nov 2020 19:20:36.462 * Ready to accept connections
python   |  * Serving Flask app "app" (lazy loading)
python   |  * Environment: production
python   |    WARNING: This is a development server. Do not use it in a production deployment.
python   |    Use a production WSGI server instead.
python   |  * Debug mode: on
python   |  * Running on http://0.0.0.0:5000/ (Press CTRL+C to quit)
python   |  * Restarting with stat
python   |  * Debugger is active!
python   |  * Debugger PIN: 289-147-891
```

4. Finally, validate from same host or from jump host, as seen below,

```
thor@jump_host /$ curl -ik http://172.16.238.12:5000
HTTP/1.0 200 OK
Content-Type: text/html; charset=utf-8
Content-Length: 50
Server: Werkzeug/1.0.1 Python/2.7.18
Date: Wed, 04 Nov 2020 19:21:12 GMT

This Compose/Flask demo has been viewed 1 time(s).

[root@stapp03 docker]# curl -ik http://localhost:5000
HTTP/1.0 200 OK
Content-Type: text/html; charset=utf-8
Content-Length: 50Server: Werkzeug/1.0.1 Python/2.7.18
Date: Wed, 04 Nov 2020 19:21:43 GMT

This Compose/Flask demo has been viewed 1 time(s).
```

Thank you.


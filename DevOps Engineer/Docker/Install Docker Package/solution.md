#### Install Docker Package

Install Docker on a linux system(CentOS),

1. Install yum-util package,

```
[steve@stapp02 ~]$ sudo yum install -y yum-utils
```

2. Add a docker repo,

```
[steve@stapp02 ~]$ sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
```

3. Install docker-ce,

```
[steve@stapp02 ~]$ sudo yum install -y docker-ce docker-ce-cli containerd.io
```

4. Start a docker daemon service using systemctl,

```
[steve@stapp02 ~]$ sudo systemctl start docker
```

5. Check the docker version,

```
[steve@stapp02 ~]$ sudo docker version
Client: Docker Engine - Community
 Version:           19.03.13
 API version:       1.40
 Go version:        go1.13.15
 Git commit:        4484c46d9d
 Built:             Wed Sep 16 17:03:45 2020
 OS/Arch:           linux/amd64
 Experimental:      false

Server: Docker Engine - Community
 Engine:
  Version:          19.03.13
  API version:      1.40 (minimum version 1.12)
  Go version:       go1.13.15
  Git commit:       4484c46d9d
  Built:            Wed Sep 16 17:02:21 2020
  OS/Arch:          linux/amd64
  Experimental:     false
 containerd:
  Version:          1.3.9
  GitCommit:        ea765aba0d05254012b0b9e595e995c09186427f
 runc:
  Version:          1.0.0-rc10
  GitCommit:        dc9208a3303feef5b3839f4323d9beb36df0a9dd
 docker-init:
  Version:          0.18.0
  GitCommit:        fec3683
```

6. Check the docker service status,

```
[steve@stapp02 ~]$ sudo systemctl status docker
● docker.service - Docker Application Container Engine
   Loaded: loaded (/usr/lib/systemd/system/docker.service; disabled; vendor preset: disabled)
   Active: active (running) since Tue 2020-12-01 07:59:59 UTC; 1min 6s ago
     Docs: https://docs.docker.com
 Main PID: 258 (dockerd)
    Tasks: 10
   Memory: 40.0M
   CGroup: /docker/4958cbea1f26f0272d17105e8951c18ad651c011459b7f7efabeb1a48713a2fd/system.slice/docker.service
           └─258 /usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock

Dec 01 07:59:59 stapp02 dockerd[258]: time="2020-12-01T07:59:59.011924872Z" level=info msg="Docker daemon" commit=4484c46d9d graphd...19.03.13
Dec 01 07:59:59 stapp02 dockerd[258]: time="2020-12-01T07:59:59.012092218Z" level=info msg="Daemon has completed initialization"
Dec 01 07:59:59 stapp02 systemd[1]: Got notification message for unit docker.service
Dec 01 07:59:59 stapp02 systemd[1]: docker.service: Got notification message from PID 258 (READY=1)
Dec 01 07:59:59 stapp02 dockerd[258]: time="2020-12-01T07:59:59.080026438Z" level=info msg="API listen on /var/run/docker.sock"
Dec 01 07:59:59 stapp02 systemd[1]: docker.service: got READY=1
Dec 01 07:59:59 stapp02 systemd[1]: docker.service changed start -> running
Dec 01 07:59:59 stapp02 systemd[1]: Job docker.service/start finished, result=done
Dec 01 07:59:59 stapp02 systemd[1]: Started Docker Application Container Engine.
Dec 01 08:00:09 stapp02 dockerd[258]: time="2020-12-01T08:00:09.969414892Z" level=error msg="Handler for POST /v1.40/containers/cre...b85a1ebc
Hint: Some lines were ellipsized, use -l to show in full.
```

7. Get the latest docker-compose binary,

```
[steve@stapp02 ~]$ sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/lo
cal/bin/docker-compose
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   651  100   651    0     0   4196      0 --:--:-- --:--:-- --:--:--  4173
100 11.6M  100 11.6M    0     0  7239k      0  0:00:01  0:00:01 --:--:-- 17.3M
```

8. Make the binary executable,

```
[steve@stapp02 ~]$ sudo chmod +x /usr/local/bin/docker-compose
```

9. Create a symbolic link,

```
[steve@stapp02 ~]$ sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```

10. Finally, check the docker-compose version,

```
[steve@stapp02 ~]$ docker-compose --version
docker-compose version 1.27.4, build 40524192
```

Thank you.

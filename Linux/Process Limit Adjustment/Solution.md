#### Process Limit Adjustment

1. SSH to the Storage server,

```
thor@jumphost ~$ ssh natasha@ststor01
natasha@ststor01's password: 
Last login: Mon Nov 17 17:27:11 2025 from 172.16.238.2
[natasha@ststor01 ~]$ sudo su -
[sudo] password for natasha: 
Last login: Mon Nov 17 17:27:19 UTC 2025 on pts/0
```

2. Now, set a soft limit and hard limit for a user nfsuser in `/etc/security/limits.conf` file as shown below,

```
[root@ststor01 ~]# vi /etc/security/limits.conf
...
...
#*               soft    core            0
#*               hard    rss             10000
#@student        hard    nproc           20
#@faculty        soft    nproc           20
#@faculty        hard    nproc           50
#ftp             hard    nproc           0
#@student        -       maxlogins       4
nfsuser          soft    nproc           1024
nfsuser          hard    nproc           2026
```

3. Validate the same using grep command,

```
[root@ststor01 ~]# cat /etc/security/limits.conf | grep nproc | grep -v ^#
nfsuser          soft    nproc           1024
nfsuser          hard    nproc           2026
```
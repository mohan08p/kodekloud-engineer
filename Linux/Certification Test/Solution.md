## Certification Test

#### Answer 1

```
chage -E 2023-12-07 jim
```

#### Answer 2

```
[root@stapp02 ~]# ls -ltr /home/usersdata/
total 12
-rw-r--r-- 1 jim  jim     0 Dec  5 06:28 test04.txt
-rw-r--r-- 1 jim  jim     0 Dec  5 06:28 test03.txt
-rw-r--r-- 1 jim  jim     0 Dec  5 06:28 test02.txt
-rw-r--r-- 1 jim  jim     0 Dec  5 06:28 test01.txt
drwxr-xr-x 2 jim  jim  4096 Dec  5 06:28 devops03
drwxr-xr-x 2 jim  jim  4096 Dec  5 06:28 devops02
drwxr-xr-x 2 jim  jim  4096 Dec  5 06:28 devops01
-rw-r--r-- 1 root root    0 Dec  5 06:28 check04.txt
-rw-r--r-- 1 root root    0 Dec  5 06:28 check03.txt
-rw-r--r-- 1 root root    0 Dec  5 06:28 check02.txt
-rw-r--r-- 1 root root    0 Dec  5 06:28 check01.txt
[root@stapp02 ~]# find /home/usersdata/ -type f -user jim 
/home/usersdata/test04.txt
/home/usersdata/test02.txt
/home/usersdata/test03.txt
/home/usersdata/test01.txt
[root@stapp02 ~]# find /home/usersdata/ -type f -user jim -exec cp --parents {} /ecommerce \;
[root@stapp02 ~]# ls -ltr /ecommerce/
total 4
drwxr-xr-x 3 root root 4096 Dec  5 06:35 home
[root@stapp02 ~]# ls -ltr /ecommerce/home/
total 4
drwxr-xr-x 2 root root 4096 Dec  5 06:35 usersdata
[root@stapp02 ~]# ls -ltr /ecommerce/home/usersdata/
total 0
-rw-r--r-- 1 root root 0 Dec  5 06:35 test04.txt
-rw-r--r-- 1 root root 0 Dec  5 06:35 test02.txt
-rw-r--r-- 1 root root 0 Dec  5 06:35 test03.txt
-rw-r--r-- 1 root root 0 Dec  5 06:35 test01.txt
```

#### Answer 3

```
[root@stapp02 ~]# cd /var/www//html/
[root@stapp02 html]# touch index.html
[root@stapp02 html]# echo "Welcome to the KKE labs!" > index.html
[root@stapp02 html]# ls -ltr
total 8
drwxr-xr-x 5 root root 4096 Dec  5 05:05 wordpress
-rw-r--r-- 1 root root   25 Dec  5 06:51 index.html
[root@stapp02 html]# cat index.html 
Welcome to the KKE labs!
```

#### Answer 4



### Answer 5

[root@stapp02 ~]# ls -ltr /usr/share/data
ls: cannot access '/usr/share/data': No such file or directory
[root@stapp02 ~]# touch /usr/share/data
[root@stapp02 ~]# chmod -R 700 /usr/share/data 
[root@stapp02 ~]# ls -ltr /usr/share/data
-rwx------ 1 root root 0 Dec  5 07:08 /usr/share/data

#### Answer 6

cd /var/log
[root@ststor01 log]# tar -cvf logs.tar /var/log/

[root@ststor01 log]# tar -cvzf logs.tar.gz /var/log

[root@ststor01 log]# ls -ltr
total 3072
drwxr-xr-x 2 root root    4096 Aug 26 04:16 anaconda
drwx------ 2 root root    4096 Aug 29 04:35 private
-rw-rw---- 1 root utmp       0 Aug 29 04:35 btmp
lrwxrwxrwx 1 root root      39 Aug 29 04:35 README -> ../../usr/share/doc/systemd/README.logs
-rw-r--r-- 1 root root   35190 Aug 30 16:17 dnf.librepo.log
-rw-r--r-- 1 root root   10742 Aug 30 16:17 dnf.rpm.log
-rw-r--r-- 1 root root     600 Aug 30 16:17 hawkey.log
-rw-r--r-- 1 root root   71109 Aug 30 16:17 dnf.log
-rw-rw-r-- 1 root utmp    1152 Dec  5 07:11 wtmp
-rw-rw-r-- 1 root utmp  292584 Dec  5 07:11 lastlog
-rw-r--r-- 1 root root 2211840 Dec  5 07:14 logs.tar
-rw-r--r-- 1 root root  496201 Dec  5 07:16 logs.tar.gz

#### Answer 7

cat /etc/nsswitch.conf | grep -i "capital" > /home/natasha/filtered1

#### Answer 8

[banner@stapp03 ~]$ sudo yum remove logrotate
[sudo] password for banner: 
Dependencies resolved.
=======================================================================
 Package         Architecture Version              Repository     Size
=======================================================================
Removing:
 logrotate       x86_64       3.18.0-12.el9        @baseos       149 k

Transaction Summary
=======================================================================
Remove  1 Package

Freed space: 149 k
Is this ok [y/N]: y
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Preparing        :                                               1/1 
  Running scriptlet: logrotate-3.18.0-12.el9.x86_64                1/1 
Removed "/etc/systemd/system/timers.target.wants/logrotate.timer".

  Erasing          : logrotate-3.18.0-12.el9.x86_64                1/1 
  Verifying        : logrotate-3.18.0-12.el9.x86_64                1/1 

Removed:
  logrotate-3.18.0-12.el9.x86_64                                       

Complete!

#### Answer 9

[banner@stapp03 ~]$ sudo yum install bind -y

[banner@stapp03 ~]$ sudo systemctl start named
[banner@stapp03 ~]$ sudo systemctl enable named
Created symlink /etc/systemd/system/multi-user.target.wants/named.service → /usr/lib/systemd/system/named.service.

#### Answer 10

sudo yum install samba -y
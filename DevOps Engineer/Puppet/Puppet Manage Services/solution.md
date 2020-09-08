#### Puppet Manage Services

1. change directory to manifests, 

```
cd /etc/puppetlabs/code/environments/production/manifests
```

2. Create a puppet programming file `beta.pp` and write the connfiguration,

```
vi beta.pp
#### Refer same directory for config file 
```

3. Use validate the check if there is any issue with the above script, blank, means everything is fine.

```
root@jump_host /etc/puppetlabs/code/environments/production/manifests# puppet parser validate beta.pp
root@jump_host /etc/puppetlabs/code/environments/production/manifests#
```

4. Now, SSH to App servers respectively and run using --noop and without noop,

```
[root@stapp02 steve]# puppet agent -tv --noop
Info: Using configured environment 'production'
Info: Retrieving pluginfacts
Info: Retrieving plugin
Info: Retrieving locales
Info: Applying configuration version '1599541801'
Notice: /Stage[main]/Nginx_package/Package[vsftpd]/ensure: current_value 'purged', should be 'present' (noop)
Notice: /Stage[main]/Nginx_package/Service[nginx]/ensure: current_value 'stopped', should be 'running' (noop)
Info: /Stage[main]/Nginx_package/Service[nginx]: Unscheduling refresh on Service[nginx]
Notice: Class[Nginx_package]: Would have triggered 'refresh' from 2 events
Notice: Stage[main]: Would have triggered 'refresh' from 1 event
Notice: Applied catalog in 0.58 seconds

[root@stapp02 steve]# puppet agent -tv
Info: Using configured environment 'production'
Info: Retrieving pluginfacts
Info: Retrieving plugin
Info: Retrieving locales
Info: Caching catalog for stapp02.stratos.xfusioncorp.com
Info: Applying configuration version '1599541873'
Notice: /Stage[main]/Nginx_package/Package[vsftpd]/ensure: created
Notice: /Stage[main]/Nginx_package/Service[vsftpd]/ensure: ensure changed 'stopped' to 'running'
Info: /Stage[main]/Nginx_package/Service[vsftpd]: Unscheduling refresh on Service[vsftpd]
Notice: Applied catalog in 9.65 seconds
```

5. Finally validate the status of the `vsftpd` service which we installed,

```
[root@stapp02 steve]# service vsftpd status
Redirecting to /bin/systemctl status vsftpd.service
● vsftpd.service - Vsftpd ftp daemon
   Loaded: loaded (/usr/lib/systemd/system/vsftpd.service; enabled; vendor preset: disabled)
   Active: active (running) since Tue 2020-09-08 05:11:24 UTC; 34s ago
 Main PID: 413 (vsftpd)
   CGroup: /docker/dba800426aa7741bc1ba8beb134ac4a6ab51f8c44ea238bfdfc78d8e9a8631b9/system.slice/vsftpd.service
           └─413 /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf

Sep 08 05:11:24 stapp02 systemd[1]: Forked /usr/sbin/vsftpd as 412
Sep 08 05:11:24 stapp02 systemd[1]: vsftpd.service changed dead -> start
Sep 08 05:11:24 stapp02 systemd[1]: Starting Vsftpd ftp daemon...
Sep 08 05:11:24 stapp02 systemd[1]: Child 412 belongs to vsftpd.service
Sep 08 05:11:24 stapp02 systemd[1]: vsftpd.service: control process exited, code=exited status=0
Sep 08 05:11:24 stapp02 systemd[1]: vsftpd.service got final SIGCHLD for state start
Sep 08 05:11:24 stapp02 systemd[1]: Main PID guessed: 413
Sep 08 05:11:24 stapp02 systemd[1]: vsftpd.service changed start -> running
Sep 08 05:11:24 stapp02 systemd[1]: Job vsftpd.service/start finished, result=done
Sep 08 05:11:24 stapp02 systemd[1]: Started Vsftpd ftp daemon.
```
Thank you.

#### Puppet Manage Archives

1. change directory to manifests, 

```
cd /etc/puppetlabs/code/environments/production/manifests
```

2. Create a puppet programming file `beta.pp` and write the connfiguration,

```
vi beta.pp
#### Refer same directory for config file 
```

3. Use validate to check if there is any issue with the above script, blank, means everything is fine.

```
root@jump_host /etc/puppetlabs/code/environments/production/manifests# puppet parser validate beta.pp
root@jump_host /etc/puppetlabs/code/environments/production/manifests#
```

4. Now SSH to the app server and run using --noop and without noop,

```
[root@stapp01 tony]# puppet agent -tv
Info: Using configured environment 'production'
Info: Retrieving pluginfacts
Info: Retrieving plugin
Info: Retrieving locales
Info: Loading facts
Info: Caching catalog for stapp01.stratos.xfusioncorp.com
Info: Applying configuration version '1602742437'
Notice: /Stage[main]/Mymodule/Archive[/opt/beta/beta.zip]/ensure: download archive from /usr/src/beta/beta.zip to /opt/beta/beta.zip and extracted in /opt/beta with cleanup
Notice: Applied catalog in 0.18 seconds
```

5. Check the directory to validate if it has extracted correctly,

```
[root@stapp01 opt]# cd /opt/beta/

[root@stapp01 beta]# ls -ltr
total 12
-rw-r--r-- 1 root root  54 Oct 15 06:12 beta.txt
-rw-r--r-- 1 root root  33 Oct 15 06:12 beta2.txt
-rw-r--r-- 1 root root 399 Oct 15 06:13 beta.zip
```

Thank you.

#### Puppet Add Users

1. change directory to manifests, 

```
cd /etc/puppetlabs/code/environments/production/manifests
```

2. Create a puppet programming file `cluster.pp` and write the connfiguration,

```
vi cluster.pp
#### Refer same directory for config file 
```

3. Use validate the check if there is any issue with the above script, blank, means everything is fine.

```
root@jump_host /etc/puppetlabs/code/environments/production/manifests# puppet parser validate cluster.pp
root@jump_host /etc/puppetlabs/code/environments/production/manifests#
```

4. Now SSH to the app server and run using --noop and without noop,

```
[root@stapp01 tony]# puppet agent -tv
Info: Using configured environment 'production'
Info: Retrieving pluginfacts
Info: Retrieving plugin
Info: Retrieving locales
Info: Caching catalog for stapp01.stratos.xfusioncorp.com
Info: Applying configuration version '1601966529'
Notice: /Stage[main]/User/User[ammar]/ensure: created
Notice: Applied catalog in 0.07 seconds
```

5. Now, check inside /home directory that user home dir got created,

```
[root@stapp01 tony]# cd /home/

[root@stapp01 home]# ls -ltr
total 12
drwx------ 2 ansible ansible 4096 Oct 15  2019 ansible
drwx------ 2 tony    tony    4096 Jan 25  2020 tony
drwx------ 2 ammar   ammar   4096 Oct  6 06:42 ammar
```

6 Also, validate that the `UID` is assigned correctly,

```
[root@stapp01 home]# cat /etc/passwd | grep ammar
ammar:x:1199:1199:ammar user:/home/ammar:/bin/bash
```

Thank you.

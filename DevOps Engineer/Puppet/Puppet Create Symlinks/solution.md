#### Puppet Create Symlinks

1. On jump host change directory to Puppet manifests directroy, 

```
root@jump_host /# cd /etc/puppetlabs/code/environments/production/manifests
```

2. Create a puppet programming file `cluster.pp` and create a class as named `symlink`,

```
vi cluster.pp
```

Check the respective cluster.pp file for it's content.

3. Then, validate the code file using a command,

```
puppet parser validate official.pp
```

4. Now SSH to respective app servers and uun it with noop and without noop,

```
[root@stapp01 tony]# puppet agent -tv --noop
Info: Using configured environment 'production'
Info: Retrieving pluginfacts
Info: Retrieving plugin
Info: Retrieving locales
Info: Applying configuration version '1597774768'
Notice: /Stage[main]/Symlink/File[/opt/finance]/ensure: current_value 'absent', should be 'link' (noop)
Notice: /Stage[main]/Symlink/File[/opt/finance/blog.txt]/ensure: current_value 'absent', should be 'present' (noop)
Notice: Class[Symlink]: Would have triggered 'refresh' from 2 events
Notice: Stage[main]: Would have triggered 'refresh' from 1 event
Notice: Applied catalog in 0.05 seconds


[root@stapp01 tony]# cd /opt/finance
bash: cd: /opt/finance: No such file or directory
[root@stapp01 tony]# cd /opt/
[root@stapp01 opt]# ls -ltr
total 4
drwxr-xr-x 1 root root 4096 May 23 07:03 puppetlabs

[root@stapp01 opt]# puppet agent -tv
Info: Using configured environment 'production'
Info: Retrieving pluginfacts
Info: Retrieving plugin
Info: Retrieving locales
Info: Caching catalog for stapp01.stratos.xfusioncorp.com
Info: Applying configuration version '1597774807'
Notice: /Stage[main]/Symlink/File[/opt/finance]/ensure: created
Notice: /Stage[main]/Symlink/File[/opt/finance/blog.txt]/ensure: created
Notice: Applied catalog in 0.04 seconds
```

5. Finally validate the symlink is created and file `blog.txt` is present,

```
[root@stapp01 opt]# ls -ltr
total 4
drwxr-xr-x 1 root root 4096 May 23 07:03 puppetlabs
lrwxrwxrwx 1 root root   13 Aug 18 18:20 finance -> /var/www/html

[root@stapp01 opt]# cd finance/
[root@stapp03 finance]# ls -ltr
total 0
-rwxr--r-- 1 root root 0 Aug 18 18:20 blog.txt

[root@stapp03 finance]# ls -ltr /var/www/html/
total 0
-rwxr--r-- 1 root root 0 Aug 18 18:20 blog.txt
```

Thank you.

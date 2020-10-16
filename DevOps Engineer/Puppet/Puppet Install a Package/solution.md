#### Puppet Install a Package

1. change directory to manifests, 

```
cd /etc/puppetlabs/code/environments/production/manifests
```

2. Create a puppet programming file `news.pp` and write the connfiguration,

```
vi news.pp
#### Refer same directory for config file 
```

3. Use validate to check if there is any issue with the above script, blank, means everything is fine.

```
root@jump_host /etc/puppetlabs/code/environments/production/manifests# puppet parser validate news.pp
root@jump_host /etc/puppetlabs/code/environments/production/manifests#
```

4. Now SSH to the app server and run using --noop and without noop,

```
[root@stapp01 tony]# puppet agent -tv
Info: Using configured environment 'production'
Info: Retrieving pluginfacts
Info: Retrieving plugin
Info: Retrieving locales
Info: Caching catalog for stapp01.stratos.xfusioncorp.comInfo: Applying configuration version '1602864893'Notice: /Stage[main]/Mymodule/Package[nginx]/ensure: created
Notice: Applied catalog in 18.09 seconds[root@stapp01 tony]#
```

5. Now validate that the nginx service is available,

```
[root@stapp01 tony]# service nginx status
Redirecting to /bin/systemctl status nginx.service
● nginx.service - The nginx HTTP and reverse proxy server
   Loaded: loaded (/usr/lib/systemd/system/nginx.service; disabled; vendor preset: disabled)
   Active: inactive (dead)

Oct 16 16:15:11 stapp01 systemd[1]: Trying to enqueue job nginx.service/reload/replace
Oct 16 16:15:11 stapp01 systemd[1]: Collecting nginx.service
Oct 16 16:15:11 stapp01 systemd[1]: Collecting nginx.service
Oct 16 16:15:11 stapp01 systemd[1]: Trying to enqueue job nginx.service/reload/replace
Oct 16 16:15:11 stapp01 systemd[1]: Installed new job nginx.service/reload as 138
Oct 16 16:15:11 stapp01 systemd[1]: Enqueued job nginx.service/reload as 138
Oct 16 16:15:11 stapp01 systemd[1]: Unit nginx.service cannot be reloaded because it is inactive.
Oct 16 16:15:11 stapp01 systemd[1]: Job nginx.service/reload finished, result=invalid
Oct 16 16:15:11 stapp01 systemd[1]: Collecting nginx.service
Oct 16 16:15:11 stapp01 systemd[1]: Collecting nginx.service
```

Thank you.

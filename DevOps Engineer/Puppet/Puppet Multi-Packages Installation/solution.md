#### Puppet Multi-Packages Installation

1. Change directory to manifests, 

```
cd /etc/puppetlabs/code/environments/production/manifests
```

2. Create a puppet programming file `apps.pp` and write the connfiguration,

```
vi apps.pp
#### Refer same directory for config file 
```

3. Use validate to check if there is any issue with the above script, blank, means everything is fine.

```
root@jump_host /etc/puppetlabs/code/environments/production/manifests# puppet parser validate apps.pp
root@jump_host /etc/puppetlabs/code/environments/production/manifests#
```

4. Now SSH to the app server 1 and run using --noop and without noop,

```
[root@stapp01 tony]# puppet agent -tv
Info: Using configured environment 'production'
Info: Retrieving pluginfacts
Info: Retrieving plugin
Info: Retrieving locales
Info: Caching catalog for stapp01.stratos.xfusioncorp.comInfo: Applying configuration version '1602864893'Notice: /Stage[main]/multi_package_node/Package[multi_package]/ensure: created
Notice: Applied catalog in 18.09 seconds[root@stapp01 tony]#
```

Thank you.

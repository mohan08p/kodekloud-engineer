#### Puppet String Manipulation

1. First, change directory to `manifest` on jump host,

```
thor@jump_host /$ cd /etc/puppetlabs/code/environments/production/manifests
```

2. Create a cluster.pp puppet programming file,

```
thor@jump_host /$ vi cluster.pp
```

*NOTE: Check same directory for puppet config file*

3. Run a validation script on this pp file created,

```
thor@jump_host /$ puppet parser validate cluster.pp
```

4. Now, SSH to App server 2 and check first the content of `cluster.txt` file, we can see as below,

```
[root@stapp02 steve]# cat /opt/itadmin/cluster.txt
This is  Nautilus sample file, created using Puppet!
Welcome to Nautilus Industries!
Please do not modify this file manually!
```

5. Now, run a puppet agent update using --noop and with noop,

```
[root@stapp02 steve]# puppet agent -tv --noop
Info: Using configured environment 'production'
Info: Retrieving pluginfacts
Info: Retrieving plugin
Info: Retrieving locales
Info: Loading facts
Info: Applying configuration version '1600112050'
Notice: /Stage[main]/Line_replace/File_line[replace]/ensure: current_value 'absent', should be 'present' (noop)
Notice: Class[Line_replace]: Would have triggered 'refresh' from 1 event
Notice: Stage[main]: Would have triggered 'refresh' from 1 event
Notice: Applied catalog in 0.11 seconds

[root@stapp02 steve]# puppet agent -tv
Info: Using configured environment 'production'
Info: Retrieving pluginfacts
Info: Retrieving plugin
Info: Retrieving locales
Info: Loading facts
Info: Caching catalog for stapp02.stratos.xfusioncorp.com
Info: Applying configuration version '1600112064'
Notice: /Stage[main]/Line_replace/File_line[replace]/ensure: created
Notice: Applied catalog in 0.10 seconds
```

6. Now validate the content of the file `cluster.txt`, 

```
[root@stapp02 steve]# cat /opt/itadmin/cluster.txt
This is  Nautilus sample file, created using Puppet!
Welcome to xFusionCorp Industries!
Please do not modify this file manually!
```

Thank you.

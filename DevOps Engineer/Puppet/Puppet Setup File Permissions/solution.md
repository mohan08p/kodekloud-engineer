#### Puppet Setup File Permissions

SSH to App server 3 in second terminal window.

On Jump host change a directy to `/etc/puppetlabs/code/environments/production/manifests` and create a file `news.pp`

```
vi news.pp
```

Check the `news.pp` file content in the same directry

Then apply configuration on the App server3 

```
puppet agent -tv --noop
puppet agent tv
...
Info: Using configured environment 'production'
Info: Retrieving pluginfacts
Info: Retrieving plugin
Info: Retrieving locales
Info: Caching catalog for stapp03.stratos.xfusioncorp.com
Info: Applying configuration version '1597344114'
Notice: /Stage[main]/File_permission_change/File[/opt/sysops/beta.txt]/content:
--- /opt/sysops/beta.txt        2020-08-13 18:33:21.084618495 +0000
+++ /tmp/puppet-file20200813-286-8g6mqk 2020-08-13 18:41:56.019754167 +0000
@@ -0,0 +1 @@
+Welcome to xFusionCorp Industries!
\ No newline at end of file

Info: Computing checksum on file /opt/sysops/beta.txt
Info: /Stage[main]/File_permission_change/File[/opt/sysops/beta.txt]: Filebucketed /opt/sysops/beta.txt to puppet with sum d41d8cd98f00b204e9800998ecf8427e
Notice: /Stage[main]/File_permission_change/File[/opt/sysops/beta.txt]/content:

Notice: /Stage[main]/File_permission_change/File[/opt/sysops/beta.txt]/content: content changed '{md5}d41d8cd98f00b204e9800998ecf8427e' to '{md5}b899e8a90bbb38276f6a00012e1956fe' (corrective)
Notice: Applied catalog in 0.43 seconds
```

Finally verify the file content along with it's permissions respectively.

```
root@stapp03 sysops]# cat beta.txt
Welcome to xFusionCorp Industries![root@stapp03 sysops]#
```

Thank you.


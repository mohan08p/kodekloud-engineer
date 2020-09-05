#### Puppet Setup Local Yum Repos

Before writing puppet config file, just check if package `vsftpd` is installed or not on any one of the server, Here, I am checking on App server 2,

[root@stapp02 steve]# rpm -qa | grep vsftpd
[root@stapp02 steve]#


On Jump host change directory to `manifest` and create a puppet programming file `official.pp`,

```
cd /etc/puppetlabs/code/environments/production/manifests

vi official.pp
```
#### For reference code, check file `official.pp` in the same directory

Then, validate the code file using a command,

```
puppet parser validate official.pp
```
*NOTE: We have created an invetory file `site.pp` which you don't required if you are following the below on puppet agent node*

Run it with noop and without noop,

```
puppet apply official.pp --noop

puppet apply official.pp
```

To check if agent is able to connect with puppet master, from App server nodes, and apply the latest catalog,

```
puppet agent -tv --noop
puppet agent -tv
```

Finally verify that the `vsftpd` package is installed correctly,

```
[root@stapp02 steve]# rpm -qa | grep vsftpd
vsftpd-3.0.2-27.el7.x86_64
```

Thank you.


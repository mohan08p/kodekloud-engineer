#### Install Puppet Server

1. Install NTP as a pre-requisites package: Timings of the master and client nodes should be accurately in sync with upstream time servers because the Puppet master server master will be acting as the certificate authority.

```
yum -y install ntpdate
```

2. Setup Puppet Repository: To install the Puppet Server/Agents, we would need to add puppet repository on all the nodes.

```
rpm -Uvh https://yum.puppet.com/puppet6-release-el-7.noarch.rpm
```

3. Install a puppet server,

```
yum install -y puppetserver
```

4. Memory Allocation
By default, Puppet Server JVM is configured to use 2GB of memory. You can change it, depends on how much memory available on your master node; ensure that it is enough for managing all the nodes connected to it.

To change the value of memory allocation, edit the below file. For 512MB, use below settings.

```
vi /etc/sysconfig/puppetserver

JAVA_ARGS="-Xms512m -Xmx512m -Djruby.logger.class=com.puppetlabs.jruby_utils.jruby.Slf4jLogger"
```

5. Start and enable puppet server,

```
root@jump_host /# systemctl start puppetserver

root@jump_host /# systemctl enable puppetserver
```

6. Finally check the status, also, we can see the momory of 512m is assigned correctly,

```
root@jump_host /# systemctl status puppetserver
● puppetserver.service - puppetserver Service
   Loaded: loaded (/usr/lib/systemd/system/puppetserver.service; enabled; vendor preset: disabled)
   Active: active (running) since Mon 2020-12-28 07:31:50 UTC; 12s ago
  Process: 577 ExecStop=/opt/puppetlabs/server/apps/puppetserver/bin/puppetserver stop (code=exited, status=0/SUCCESS)
  Process: 639 ExecStart=/opt/puppetlabs/server/apps/puppetserver/bin/puppetserver start (code=exited, status=0/SUCCESS)
 Main PID: 664 (java)
    Tasks: 42 (limit: 4915)
   CGroup: /docker/1e690ce9fd6805bc523a668260741b35987035b51f4b9d2a2becf855216d8972/system.slice/puppetserver.service
           └─664 /usr/bin/java -Xms512m -Xmx512m -Djruby.logger.class=com.puppetlabs.jruby_utils.jruby.Slf4jLogger...

Dec 28 07:31:07 jump_host systemd[1]: Stopped puppetserver Service.
Dec 28 07:31:07 jump_host systemd[1]: Starting puppetserver Service...
Dec 28 07:31:50 jump_host systemd[1]: Started puppetserver Service.
```

Thank you.
#### Install Puppet Agent

1. SSH to App server 2 and in our environment, we do not need to disable SELINUX and stopping of firewalld.

2. Add the puppet repo.

```
[root@stapp02 steve]# rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
```

3. VERIFY IF THE REPO HAS BEEN ADDED

```
[root@stapp02 steve]#  yum repolist | grep puppet
puppetlabs-pc1/x86_64      Puppet Labs PC1 Repository el 7 - x86_64         102
```

4. Install puppet agent using yum,

```
yum -y install puppet-agent
```

5. Start the puppet agent service,

```
/opt/puppetlabs/bin/puppet resource service puppet ensure=running enable=true
Notice: /Service[puppet]/ensure: ensure changed 'stopped' to 'running'
service { 'puppet':
ensure => 'running',
enable => 'true',
}
```

6. Check the service status,

```
[root@stapp02 steve]# service puppet status
Redirecting to /bin/systemctl status puppet.service
● puppet.service - Puppet agent
   Loaded: loaded (/usr/lib/systemd/system/puppet.service; enabled; vendor preset: disabled)   Active: active (running) since Fri 2020-09-04 09:59:17 UTC; 28s ago
 Main PID: 576 (puppet)
   CGroup: /docker/a70d0244c00b0e3b5210e4d6da0c50668f2aa10e2f8afa3b12c9bb1bf6d0423e/system.slice/pu
ppet.service
           └─576 /opt/puppetlabs/puppet/bin/ruby /opt/puppetlabs/puppet/bin/puppet agent --no-da...

Sep 04 09:59:17 stapp02 systemd[1]: Started Puppet agent.
Sep 04 09:59:23 stapp02 puppet-agent[576]: Could not request certificate: getaddrinfo: Name o...own
Hint: Some lines were ellipsized, use -l to show in full.
```

NOTE: Further step is to register this puppet agent with the puppet master server which is not required in this task.

Thank you.

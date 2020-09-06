#### Puppet Setup Firewall Rules

NOTE: This is not the correct solution. Kindly, follow different approch for solving this problem.

1. Change directory on jum host to `manifest`,

```
root@jump_host# cd /etc/puppetlabs/code/environments/production/manifests
```

2. Install puppet module firewalld using the below command,

```
root@jump_host /etc/puppetlabs/code/environments/production/manifests# puppet module install puppet-firewalld --version 4.3.0
Notice: Preparing to install into /etc/puppetlabs/code/environments/production/modules ...
Notice: Downloading from https://forgeapi.puppet.com ...
Notice: Installing -- do not interrupt ...
/etc/puppetlabs/code/environments/production/modules
└─┬ puppet-firewalld (v4.3.0)
  └── puppetlabs-stdlib (v6.4.0)
```

3. Now create `site.pp` and `official.pp` in manifests directory,

```
vi site.pp

vi official.pp

#### Refer the current directories for the same file script.
```

4. On all app server run with --noop and without noop,

```
[root@stapp02 steve]# puppet agent -tv --noop
Info: Using configured environment 'production'
Info: Retrieving pluginfacts
Info: Retrieving plugin
Info: Retrieving locales
Info: Loading facts
Info: Applying configuration version '1599417508'
Notice: /Stage[main]/Firewall_node2/Firewalld_rich_rule[Open all incoming connection for 9006/tcp port on App Server 1]/ensure: current_value 'absent', should be 'present' (noop)

Notice: Class[Firewall_node2]: Would have triggered 'refresh' from 1 event
Notice: Stage[main]: Would have triggered 'refresh' from 1 event
Info: Creating state file /opt/puppetlabs/puppet/cache/state/state.yaml
Notice: Applied catalog in 1.32 seconds
[root@stapp02 steve]# puppet agent -tv
Info: Using configured environment 'production'
Info: Retrieving pluginfacts
Info: Retrieving plugin
Info: Retrieving locales
Info: Loading facts
Info: Caching catalog for stapp02.stratos.xfusioncorp.com
Info: Applying configuration version '1599417521'
Notice: /Stage[main]/Firewall_node2/Firewalld_rich_rule[Open all incoming connection for 9006/tcp port on App Server 1]/ensure: created
Notice: Applied catalog in 1.71 seconds
```

Thank you.

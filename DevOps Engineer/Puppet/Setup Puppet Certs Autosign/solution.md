#### Setup Puppet Certs Autosign

1. First, check if there is any hosts certificate available on puppet master node, 

```
root@jump_host /# puppetserver ca list --all
No certificates to list
```

2. We need to do autosign for each agent node. For that we need to create `autosign.conf` as below on puppet master node i.e. on jump_host,

```
root@jump_host /# vi /etc/puppetlabs/puppet/autosign.conf
```
*Note: Refer current directory for the same config file*

3. Then, restart a puppet service using a command,

```
root@jump_host /# systemctl restart puppet
```

4. Now edit the hosts files on jump host as well as on all app servers and add an alias as puppet for jump host node,

```
root@jump_host /# vi /etc/hosts
172.16.238.1    jump_host.stratos.xfusioncorp.com puppet
172.16.238.2    jump_host.stratos.xfusioncorp.com puppet

As on App server you can do as below,

[root@stapp01 tony]# cat /etc/hosts
127.0.0.1       localhost
::1     localhost ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
172.16.238.3    jump_host.stratos.xfusioncorp.com puppet
172.16.239.5    stapp01.stratos.xfusioncorp.com stapp01
172.16.238.10   stapp01.stratos.xfusioncorp.com stapp01

```

NOTE: If you do not add, you might failed while runnning/updating agent nodes with master node as they connect using the hostname.

5. Now on all app server, run agent test using a command,

```
[root@stapp01 tony]# puppet agent -tv
```

6. Finally, validate that the certificates are present for all nodes including master node,

```
root@jump_host /# puppetserver ca list --all
Signed Certificates:
    stapp03.stratos.xfusioncorp.com         (SHA256)  7D:C7:50:7F:35:E1:E6:51:B0:C4:51:A1:1B:49:A7:42:FE:61:07:CB:3D:DF:1C:11:B1:AC:75:E5:F4:E5:F6:F1
    stapp02.stratos.xfusioncorp.com         (SHA256)  48:A4:0D:7E:6C:AE:AD:97:55:E3:68:68:42:20:45:03:9F:69:39:81:43:1B:6E:2A:E0:CC:45:28:CE:40:A7:DB
    stapp01.stratos.xfusioncorp.com         (SHA256)  4F:8C:15:A8:54:26:0D:C9:A4:F5:31:BF:BC:CA:B2:DC:10:57:ED:BD:62:8B:B2:55:FB:E0:15:08:2F:F7:00:18
    jump_host.stratos.xfusioncorp.com       (SHA256)  84:C1:0B:45:8E:40:DB:D6:E3:0A:D2:0E:8E:1E:40:35:DE:E7:9F:23:0B:C0:08:D2:29:19:6D:01:C2:56:27:B7 alt names: ["DNS:puppet", "DNS:jump_host.stratos.xfusioncorp.com"]      authorization extensions: [pp_cli_auth: true]
```

Thank you.

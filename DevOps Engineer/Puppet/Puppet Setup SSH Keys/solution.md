#### Puppet Setup SSH Keys

1. Change directory to `manifest` on puppet master node(jump_host),

```
root@jump_host /home/thor# cd /etc/puppetlabs/code/environments/production/manifests
```

2. Check that SSH public key is present on puppet master node, we will be adding this key to `authorized_keys` on all app servers, respectively..

```
root@jump_host /etc/puppetlabs/code/environments/production/manifests# cat ~/.ssh/id_rsa.pub
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCqMWxj1XwglDg2ug1O7OB78lsmA91mi7URN5BbV3x4RYR/iEr0rdw32/Jx4iFwevyyXeoIQfbmzMgRFDeav8S4Nby/LPHpYC8bBWJ3kNKU+ROONgMp6d5xjswNLz52TEeNY/FBSTiJJjjHAaFDLxerc8ROpWeNAOH2BaySqtZu502hGKcb+1YLvAuoElsWf8Z5g3qTjcGCvWfmU2r1dN+iRPB0yxU1sws0dBFONGZHJPs+HfQzdBG11XoSOEUcgnqqd1wEx9y0n+NuPo9oD3W6kyUu6rN5b9SHHE+eOkdYpqLDxlNX9rR6mf7AzguSToZS4XzJPCf7eJrpzRiplyXH root@jump_host
```

3. Now, create puppet programming file, `official.pp` with resource  `ssh_authorized_key` to copy ssh key,

```
root@jump_host vi official.pp
```
*Note: Refer same directory for its configuration*

3. Now, validate the pp file using parser,

```
root@jump_host /etc/puppetlabs/code/environments/production/manifests# puppet parser validate official.pp
root@jump_host /etc/puppetlabs/code/environments/production/manifests#
```

4. On all all servers, run a test,

```
[tony@stapp01 ~]$ sudo puppet agent -tv

We trust you have received the usual lecture from the local System
Administrator. It usually boils down to these three things:

    #1) Respect the privacy of others.
    #2) Think before you type.
    #3) With great power comes great responsibility.

[sudo] password for tony:
Info: Using configured environment 'production'
Info: Retrieving pluginfacts
Info: Retrieving plugin
Info: Retrieving locales
Info: Caching catalog for stapp01.stratos.xfusioncorp.com
Info: Applying configuration version '1600606610'
Notice: /Stage[main]/Ssh_node1/Ssh_authorized_key[root@jump_host]/ensure: created
Notice: Applied catalog in 0.05 seconds
```

5. Finally, validate the contents of `authorized_keys` on all app servers or you can do try to ssh as shown below, which should not show enter a password prompt,

```
root@jump_host /etc/puppetlabs/code/environments/production/manifests# ssh tony@172.16.238.10
Last login: Sun Sep 20 12:52:53 2020 from jump_host.stratos.xfusioncorp.com
[tony@stapp01 ~]$ exit
logout
Connection to 172.16.238.10 closed.
root@jump_host /etc/puppetlabs/code/environments/production/manifests# ssh steve@172.16.238.11
Last login: Sun Sep 20 12:53:14 2020 from jump_host.stratos.xfusioncorp.com[steve@stapp02 ~]$ exit
logout
Connection to 172.16.238.11 closed.
root@jump_host /etc/puppetlabs/code/environments/production/manifests# ssh banner@172.16.238.12
Last login: Sun Sep 20 12:53:30 2020 from jump_host.stratos.xfusioncorp.com
[banner@stapp03 ~]$ exit
logout
Connection to 172.16.238.12 closed.
root@jump_host /etc/puppetlabs/code/environments/production/manifests#
```

Thank you.

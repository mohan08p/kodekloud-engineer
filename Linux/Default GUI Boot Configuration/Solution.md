#### Default GUI Boot Configuration

1. First SSH to all App Servers, and follow the below step 2 and 3 on all the app servers, respectively. Here, I'll be showing on App Server 1,

```bash
thor@jumphost ~$ ssh tony@stapp01
The authenticity of host 'stapp01 (172.16.238.10)' can't be established.
ED25519 key fingerprint is SHA256:XAi2bk31Mbb7XukAqymXeInp5k/7rZeAPBjInPNQK9o.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'stapp01' (ED25519) to the list of known hosts.
tony@stapp01's password: 
[tony@stapp01 ~]$ 
[tony@stapp01 ~]$ sudo su -

We trust you have received the usual lecture from the local System
Administrator. It usually boils down to these three things:

    #1) Respect the privacy of others.
    #2) Think before you type.
    #3) With great power comes great responsibility.

[sudo] password for tony: 
[root@stapp01 ~]# 
```

2. Now, set the runlevel to have GUI by default using `systemctl`,

```bash
[root@stapp01 ~]# systemctl set-default graphical.target
Removed "/etc/systemd/system/default.target".
Created symlink /etc/systemd/system/default.target → /usr/lib/systemd/system/graphical.target.
```

3. Validate the runlevel set,

```bash
[root@stapp01 ~]# systemctl get-default
graphical.target
```
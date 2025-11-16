#### Firewall Configuration

1. SSH to the Backup server,

```bash
thor@jumphost ~$ ssh clint@stbkp01
The authenticity of host 'stbkp01 (172.16.238.16)' can't be established.
ED25519 key fingerprint is SHA256:5ama7XapAR8F/td2wlB+oCcrrnwO9wgZcTw8o94Hgjk.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'stbkp01' (ED25519) to the list of known hosts.
clint@stbkp01's password: 
[clint@stbkp01 ~]$ sudo su -

We trust you have received the usual lecture from the local System
Administrator. It usually boils down to these three things:

    #1) Respect the privacy of others.
    #2) Think before you type.
    #3) With great power comes great responsibility.

[sudo] password for clint: 
[root@stbkp01 ~]#
```

2. Open port 8085 in public zone using the following command,

```bash
[root@stbkp01 ~]# firewall-cmd --zone=public --add-port=8085/tcp
success
```

3. Finally, you can verify the same using the command,

```bash
[root@stbkp01 ~]# firewall-cmd --zone=public --list-ports
8085/tcp
```
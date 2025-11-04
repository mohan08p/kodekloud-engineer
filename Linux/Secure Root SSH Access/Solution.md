#### Secure Root SSH Access

We need to perform the Root SHH disable on all the app servers. Here, I'll be doing it for th App Server 1 and you can follow the similar steps to perform on the App Server 2 and App Server 3, respectively/

1. First SSH to the App Server 1,

```bash
thor@jumphost ~$ ssh tony@stapp01
The authenticity of host 'stapp01 (172.16.238.10)' can't be established.
ED25519 key fingerprint is SHA256:bexBSOqkepm+16ogi15cys0aKG74InwXLy095xXNgo0.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'stapp01' (ED25519) to the list of known hosts.
tony@stapp01's password: 
[tony@stapp01 ~]$ 
```

2. Then, opem up the sshd_config file from /etc/ssh directory, and update the value of `PermitRootLogin` from yes to no as shown below,

```bash
[root@stapp01 ~]# sudo vi /etc/ssh/sshd_config

PermitRootLogin no
```

3. Finally restart the sshd service,

```bash
[root@stapp01 ~]$ sudo service sshd restart
Redirecting to /bin/systemctl restart sshd.service
```
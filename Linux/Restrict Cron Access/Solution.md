# Restrict Cron Access

1. Login to the App server 1,

```bash
thor@jumphost ~$ ssh tony@stapp01
The authenticity of host 'stapp01 (172.16.238.10)' can't be established.
ED25519 key fingerprint is SHA256:ksC/BC6aHs1j7cLORIAEqtvT36GgnCKNPwy+KnPAJ8A.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'stapp01' (ED25519) to the list of known hosts.
tony@stapp01's password: 
[tony@stapp01 ~]$ 
```

2. validate if cron.allow and cron.deny files present at the /etc location. I do not found it so I can created both the files as follows,

```bash
[tony@stapp01 ~]$ sudo touch /etc/cron.allow

We trust you have received the usual lecture from the local System
Administrator. It usually boils down to these three things:

    #1) Respect the privacy of others.
    #2) Think before you type.
    #3) With great power comes great responsibility.

[sudo] password for tony: 
[tony@stapp01 ~]$
```

3. Now, we can add user `javed` to the cron allow list and user `garrett` in the cron deny list as follows,

```bash
[tony@stapp01 ~]$ sudo su -
[root@stapp01 ~]# echo "javed" >> /etc/cron.allow 
[root@stapp01 ~]# echo "garrett" >> /etc/cron.deny
```
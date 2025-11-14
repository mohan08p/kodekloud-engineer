# Timezone Alignment

1. First SSH to all App Servers, and follow the below step 2 to 4 on all the app servers, respectively. Here, I'll be showing on App Server 1,

```bash
thor@jumphost ~$ ssh tony@stapp01
The authenticity of host 'stapp01 (172.16.238.10)' can't be established.
ED25519 key fingerprint is SHA256:ksC/BC6aHs1j7cLORIAEqtvT36GgnCKNPwy+KnPAJ8A.
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

2. Check the current timing using `timedatectl`,

```bash
[root@stapp01 ~]# timedatectl
               Local time: Fri 2025-11-14 05:30:14 UTC
           Universal time: Fri 2025-11-14 05:30:14 UTC
                 RTC time: n/a
                Time zone: Etc/UTC (UTC, +0000)
System clock synchronized: yes
              NTP service: n/a
          RTC in local TZ: no
```

3. Now, we will set the timezone to `Indian/Mayotte` on all app servers, respectively,

```bash
[root@stapp01 ~]# timedatectl set-timezone Indian/Mayotte
```

4. Finally, validate the timezone on all app servers using `timedatectl`,

```bash
[root@stapp01 ~]# timedatectl
               Local time: Fri 2025-11-14 08:31:53 EAT
           Universal time: Fri 2025-11-14 05:31:53 UTC
                 RTC time: n/a
                Time zone: Indian/Mayotte (EAT, +0300)
System clock synchronized: yes
              NTP service: n/a
          RTC in local TZ: no
```
#### SElinux Installation and Configuration

1. SSH to App server 1,

```
thor@jumphost ~$ ssh tony@stapp01
The authenticity of host 'stapp01 (172.16.238.10)' can't be established.
ED25519 key fingerprint is SHA256:UtGCbsS+iHhg/qbeC9K/XRW8d2fCqV3fe/Gb+6rnRKU.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'stapp01' (ED25519) to the list of known hosts.
tony@stapp01's password: 
[tony@stapp01 ~]$ sudo su -

We trust you have received the usual lecture from the local System
Administrator. It usually boils down to these three things:

    #1) Respect the privacy of others.
    #2) Think before you type.
    #3) With great power comes great responsibility.

[sudo] password for tony: 
[root@stapp01 ~]# 
```

2. Now, install the SElinux on CentOS system,

```
[root@stapp01 ~]# yum install -y selinux-policy selinux-policy-targetedCentOS Stream 9 - BaseOS                28 kB/s | 7.6 kB     00:00    
CentOS Stream 9 - BaseOS               1.9 MB/s | 8.8 MB     00:04    
CentOS Stream 9 - AppStream             31 kB/s | 7.8 kB     00:00    
CentOS Stream 9 - AppStream            3.3 MB/s |  25 MB     00:07    
CentOS Stream 9 - Extras packages       31 kB/s | 8.3 kB     00:00    
CentOS Stream 9 - Extras packages       2
...
...
Installed:
  diffutils-3.7-12.el9.x86_64                                          
  libselinux-utils-3.6-3.el9.x86_64                                    
  policycoreutils-3.6-3.el9.x86_64                                     
  rpm-plugin-selinux-4.16.1.3-38.el9.x86_64                            
  selinux-policy-38.1.67-1.el9.noarch                                  
  selinux-policy-targeted-38.1.67-1.el9.noarch                         

Complete!
```

3. Updated the config file property from enforcing to disabled so it will take effect at boot time.

```
[root@stapp01 ~]# vi /etc/selinux/config

#SELINUX=enforcing
SELINUX=disabled
```
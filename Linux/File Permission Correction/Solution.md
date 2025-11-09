# File Permission Correction

1. First SSH to the App Server 3,

```bash
thor@jumphost ~$ ssh banner@stapp03
The authenticity of host 'stapp03 (172.16.238.10)' can't be established.
ED25519 key fingerprint is SHA256:bexBSOqkepm+16ogi15cys0aKG74InwXLy095xXNgo0.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'stapp03' (ED25519) to the list of known hosts.
banner@stapp03's password: 
[banner@stapp03 ~]$ 
```

2. Now let's start working on one point at a time, Assing the user and group as root to a file `/etc/hostname` and validate the same,

```bash
[banner@stapp03 ~]$ sudo chown root:root /etc/hostname 

We trust you have received the usual lecture from the local System
Administrator. It usually boils down to these three things:

    #1) Respect the privacy of others.
    #2) Think before you type.
    #3) With great power comes great responsibility.

[sudo] password for banner: 

[banner@stapp03 ~]$ ls -ltr /etc/hostname 
-rw-r--r-- 1 root root 32 Nov  9 18:13 /etc/hostname
```

3. Now, update the permissions of the file so others should possess read only permissions on the file,

```bash
[banner@stapp03 ~]$  sudo chmod 644 /etc/hostname

[banner@stapp03 ~]$ ls -ltr /etc/hostname 
-rw-r--r-- 1 root root 32 Nov  9 18:13 /etc/hostname
```

4. User rose must not have any permissions on the file. for this we will use `setfacl`,

```bash
[banner@stapp03 ~]$ sudo setfacl -m u:rose:--- /etc/hostname
```

5. User jerome should be granted read only permission on the file,

```bash
[banner@stapp03 ~]$ sudo setfacl -m jerome:r-- /etc/hostname
```

6. Now, validate the ACL applied to the file using `getfacl`,

```bash
[banner@stapp03 ~]$ getfacl /etc/hostname 
getfacl: Removing leading '/' from absolute path names
# file: etc/hostname
# owner: root
# group: root
user::rw-
user:rose:---
user:jerome:r--
group::r--
mask::r--
other::r--
```
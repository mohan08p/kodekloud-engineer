# Linux User Data Transfer

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

2. Go to the directory `/home/usersda`,

```bash
[tony@stapp01 ~]$ cd /home/usersda
```

3. Now, use the find command to transfer the all files with owner name as kareem to the /news directory,

```bash
[tony@stapp01 ~]$ find /home/usersdata/ -type f -user kareem -exec cp --parents {} /news \;
```
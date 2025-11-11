#### Secure Data Transfer

1. We want to copy `/tmp/nautilus.txt.gpg` file from jump server to App Server 2 placing it in the directory `/home/opt`, we can do this using following command,

```bash
thor@jumphost ~$ scp /tmp/nautilus.txt.gpg steve@stapp02:/home/opt
The authenticity of host 'stapp02 (172.16.238.11)' can't be established.
ED25519 key fingerprint is SHA256:RUCRQPyG6TCFmZkN1vWusY48pk5PHlap6+mvrTZ6EXo.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'stapp02' (ED25519) to the list of known hosts.
steve@stapp02's password: 
nautilus.txt.gpg                     100%  105   338.1KB/s   00:00    
```

2. Now, validate the file is present on the App server 2, ssh to it and verify,

```bash 
thor@jumphost ~$ ssh steve@stapp02
steve@stapp02's password:

[steve@stapp02 ~]$ cd /home/opt/

[steve@stapp02 opt]$ ls -ltr
total 4
-rw-r--r-- 1 steve steve 105 Nov 11 05:10 nautilus.txt.gpg
```
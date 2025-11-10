# String Replacement

1. First SSH to the Nautilus Backup Server,

```bash
thor@jumphost ~$ ssh clint@stbkp01
The authenticity of host 'stbkp01 (172.16.238.16)' can't be established.
ED25519 key fingerprint is SHA256:Puk/mSR+zGC4w5FNK91mGLLKvEzL4hYPGgCls+kfeu8.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'stbkp01' (ED25519) to the list of known hosts.
clint@stbkp01's password: 
[clint@stbkp01 ~]$ 
```

2. Login to the root user,

```bash
[clint@stbkp01 ~]$ sudo su -

We trust you have received the usual lecture from the local System
Administrator. It usually boils down to these three things:

    #1) Respect the privacy of others.
    #2) Think before you type.
    #3) With great power comes great responsibility.

[sudo] password for clint: 
[root@stbkp01 ~]#
```

```

3. Now, check the current status of the String keywords in the file,

```bash
[root@stbkp01 ~]# cat /root/nautilus.xml | grep -i "String"
      <string>String</string>
      <string>String</string>
      <string>String</string>
      <string>String</string>
      <string>String</string>
      <string>String</string>
      ...
      ...
```

4. Now, by using sed utility, change all occurances of the String word with the Marine,

```bash
[root@stbkp01 ~]# sed -i 's/String/Marine/g' /root/nautilus.xml
[root@stbkp01 ~]#
```

5. Finally, validate the the file content with the String word, and we can see we do not found anything with the String word,

```bash
[root@stbkp01 ~]# cat /root/nautilus.xml | grep -i "String"
      <string>Marine</string>
      <string>Marine</string>
      <string>Marine</string>
      <string>Marine</string>
      <string>Marine</string>
      <string>Marine</string>
      <string>Marine</string>
```
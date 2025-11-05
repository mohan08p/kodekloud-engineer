#### Data Backup for Developer

1. First SSH to the Storage App server,

```bash
thor@jumphost ~$ ssh natasha@ststor01
The authenticity of host 'ststor01 (172.16.238.15)' can't be established.
ED25519 key fingerprint is SHA256:IHJK4mqC6+Qj4qd7FobGyYN+GK73rtL6U0fbcPwKmyI.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'ststor01' (ED25519) to the list of known hosts.
natasha@ststor01's password: 
[natasha@ststor01 ~]$ 
```

2. Change directory to the `/data/james/` directory, and list out the files,

```bash
[natasha@ststor01 ~]$ cd /data/james/

[natasha@ststor01 james]$ ls -ltr
total 12
-rwxrwxrwx 1 root root 10 Nov  5 04:15 nautilus1.txt
-rwxrwxrwx 1 root root 10 Nov  5 04:15 nautilus2.txt
-rwxrwxrwx 1 root root 10 Nov  5 04:15 nautilus3.txt
```

3. Now, create a `james.tar.gz` file for the path /data/james as shown below, 

```bash
[natasha@ststor01 james]$ cd ..

[natasha@ststor01 data]$ tar -cvzf james.tar.gz /data/james
tar: Removing leading `/' from member names
/data/james/
/data/james/nautilus1.txt
/data/james/nautilus2.txt
/data/james/nautilus3.txt
[natasha@ststor01 data]$ ls -ltr
total 8
drwxrwxrwx 2 root    root    4096 Nov  5 04:15 james
-rw-r--r-- 1 natasha natasha  189 Nov  5 04:20 james.tar.gz
```

4. Finally, you can copy the tar file to the /home directory on the same storage server,

```bash
[natasha@ststor01 data]$ cp james.tar.gz /home/
cp: cannot create regular file '/home/james.tar.gz': Permission denied
[natasha@ststor01 data]$ sudo cp james.tar.gz /home/

We trust you have received the usual lecture from the local System
Administrator. It usually boils down to these three things:

    #1) Respect the privacy of others.
    #2) Think before you type.
    #3) With great power comes great responsibility.

[sudo] password for natasha: 
[natasha@ststor01 data]$ 
```
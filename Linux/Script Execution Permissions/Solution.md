# Script Execution Permissions

1. First SSH to the App Server 2,

```bash
thor@jumphost ~$ ssh steve@stapp02
The authenticity of host 'stapp02 (172.16.238.11)' can't be established.
ED25519 key fingerprint is SHA256:OxbvHhPgADtGzIGTW1RCsOFk2jKtNuMeX6eV0cTjJmw.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'stapp02' (ED25519) to the list of known hosts.
steve@stapp02's password: 
[steve@stapp02 ~]$  
```

2. Validate the current permissions of the file, `/tmp/xfusioncorp.sh`

```bash
[steve@stapp02 ~]$ ls -ltr /tmp/xfusioncorp.sh 
---------- 1 root root 40 Nov  7 16:48 /tmp/xfusioncorp.sh
```

3. Now, let us assign the executable permissions to a file,

```bash
[steve@stapp02 ~]$ sudo chmod +x /tmp/xfusioncorp.sh 

We trust you have received the usual lecture from the local System
Administrator. It usually boils down to these three things:

    #1) Respect the privacy of others.
    #2) Think before you type.
    #3) With great power comes great responsibility.

[sudo] password for steve:
[steve@stapp02 ~]$ 
```

4. Now, valdiate the permissions of the file,

```bash
[steve@stapp02 ~]$ ls -ltr /tmp/xfusioncorp.sh 
---x--x--x 1 root root 40 Nov  7 16:48 /tmp/xfusioncorp.sh
```

5. We need to ensure all users should have execute permission, we can assign 755 permissions,

```bash
[steve@stapp02 ~]$ sudo chmod 755 /tmp/xfusioncorp.sh 

[steve@stapp02 ~]$ ls -ltr /tmp/xfusioncorp.sh 
-rwxr-xr-x 1 root root 40 Nov  7 17:04 /tmp/xfusioncorp.sh
```
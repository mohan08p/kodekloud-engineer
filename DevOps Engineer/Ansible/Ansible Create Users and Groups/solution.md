#### Ansible Create Users and Groups

1. Change directory to `playbook` and check the contents on jump box,

```
thor@jump_host /$ cd /home/thor/playbook/
```

2. Now, check an `inventory` file and verify the hosts as below,

```
thor@jump_host ~/ansible$ cat inventory
stapp01 ansible_host=172.16.238.10 ansible_ssh_pass=Ir0nM@n ansible_user=tony
stapp02 ansible_host=172.16.238.11 ansible_ssh_pass=Am3ric@ ansible_user=steve
stapp03 ansible_host=172.16.238.12 ansible_ssh_pass=BigGr33n ansible_user=banner
```

3. Verify the users list as mentioned in the `users.yml` file,

```
thor@jump_host ~/playbooks$ cat data/users.yml 
admins:
  - rob
  - david
  - joy

developers:
  - tim
  - ray
  - jim
  - mark
```

4. Check the password use 

```
thor@jump_host ~/playbooks$ cat secrets/vault.txt 

P@ss3or432
```

5. Use the given secret vault by adding that in the `ansible.cfg` file,

```
thor@jump_host ~/playbooks$ vi ansible.cfg 
...
vault_password_file = /home/thor/playbooks/secrets/vault.txt

thor@jump_host ~/playbooks$ cat ansible.cfg 
[defaults]
host_key_checking = False
vault_password_file = /home/thor/playbooks/secrets/vault.txt
```

6. To check ansible inventory file run command on given app server and check the current users on the system,

```
thor@jump_host ~/playbooks$ ansible stapp03 -a "cat /etc/passwd" -i inventory
stapp03 | CHANGED | rc=0 >>
root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/bin:/sbin/nologin
daemon:x:2:2:daemon:/sbin:/sbin/nologin
adm:x:3:4:adm:/var/adm:/sbin/nologin
lp:x:4:7:lp:/var/spool/lpd:/sbin/nologin
sync:x:5:0:sync:/sbin:/bin/sync
shutdown:x:6:0:shutdown:/sbin:/sbin/shutdown
halt:x:7:0:halt:/sbin:/sbin/halt
mail:x:8:12:mail:/var/spool/mail:/sbin/nologin
operator:x:11:0:operator:/root:/sbin/nologin
games:x:12:100:games:/usr/games:/sbin/nologin
ftp:x:14:50:FTP User:/var/ftp:/sbin/nologin
nobody:x:99:99:Nobody:/:/sbin/nologin
systemd-network:x:192:192:systemd Network Management:/:/sbin/nologin
dbus:x:81:81:System message bus:/:/sbin/nologin
sshd:x:74:74:Privilege-separated SSH:/var/empty/sshd:/sbin/nologin
ansible:x:1000:1000::/home/ansible:/bin/bash
banner:x:1001:1001::/home/banner:/bin/bash
```

7. Create a playbook `add_users.yml` for ansible configuration,

```
thor@jump_host ~/playbook$ vi add_users.yml
```
*NOTE: Refer the current directory for config file*

8. Now, run an ansible playbook, 

```
thor@jump_host ~/playbook$ ansible-playbook playbook.yml -i inventory

thor@jump_host ~/playbooks$ ansible-playbook -i inventory add_users.yml

PLAY [Ansible add user and group] ****************************************************************************************

TASK [Gathering Facts] ***************************************************************************************************
ok: [stapp03]

TASK [creating admin groups] *********************************************************************************************
changed: [stapp03]

TASK [creating developer group] ******************************************************************************************
changed: [stapp03]

TASK [creating users for the admins group] *******************************************************************************
changed: [stapp03] => (item=rob)
changed: [stapp03] => (item=david)
changed: [stapp03] => (item=joy)

TASK [creating users for the developers group] ***************************************************************************
changed: [stapp03] => (item=tim)
changed: [stapp03] => (item=ray)
changed: [stapp03] => (item=jim)
changed: [stapp03] => (item=mark)

PLAY RECAP ***************************************************************************************************************
stapp03                    : ok=5    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0 

9. Now, we have created the users and group, once again check the all users on the app servers and you should see the newly created users and group by the above playbook.

```
ansible stapp03 -a "cat /etc/passwd" -i inventory
```

10. Verify further by SSH on the app server using newly created user,

```
thor@jump_host ~/playbooks$ ssh rob@stapp03
The authenticity of host 'stapp03 (172.16.238.12)' can't be established.
ECDSA key fingerprint is SHA256:5tYk1FUmNK6pseeuswi4GAHpM7MpmAZB19TN9fAh8jk.
ECDSA key fingerprint is MD5:23:d4:48:ef:de:16:3b:30:0e:10:cc:cb:2f:92:32:8e.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added 'stapp03' (ECDSA) to the list of known hosts.
rob@stapp03's password: 

[rob@stapp03 ~]$ id
uid=1002(rob) gid=1004(rob) groups=1004(rob),10(wheel),1002(admins)

[rob@stapp03 ~]$ sudo su
[root@stapp03 rob]# exit
```

Thank you.

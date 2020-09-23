#### Ansible Lineinfile Module

1. Change directory to `ansible` on ansible control node,

```
thor@jump_host /$ cd /home/thor/ansible/
```

2. Check that ansible config and invetory is alredy present,

```
thor@jump_host ~/ansible$ ls -ltr
total 8
-rw-r--r-- 1 thor thor 237 Sep 20 16:44 inventory
-rw-r--r-- 1 thor thor  36 Sep 20 16:44 ansible.cfg
```

3. Cat the contents of invetory to verify all hosts(app servers) mentioned, 

```
thor@jump_host ~/ansible$ cat inventory
stapp01 ansible_host=172.16.238.10 ansible_ssh_pass=Ir0nM@n ansible_user=tony
stapp02 ansible_host=172.16.238.11 ansible_ssh_pass=Am3ric@ ansible_user=steve
stapp03 ansible_host=172.16.238.12 ansible_ssh_pass=BigGr33n ansible_user=banner
```

4. Create a ansible `playbook.yml` for our task,

```
thor@jump_host ~/ansible$ vi playbook.yml
```
*Note: Refer same directory for the file*

5. Once configuration is ready, you can run an ansible-playbook,


```
thor@jump_host ~/ansible$ ansible-playbook playbook.yml  -i inventory, you can see the final outout as below,


PLAY [Deploy playbook] *******************************************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************************ok: [stapp01]
...
...
...

TASK [Changing file owner and group permissions] *****************************************************************************************
changed: [stapp03]

PLAY RECAP *******************************************************************************************************************************
stapp01                    : ok=6    changed=5    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
stapp02                    : ok=6    changed=5    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
stapp03                    : ok=6    changed=5    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

6. Now SSH to any app sever node and change directory to `/var/www/html`,

```
[root@stapp01 tony]# cd /var/www/html/
```

7. Check if `index.html` file is created or not from our playbook along with file owner and group permissions,

```
[root@stapp01 html]# ls -ltr
total 4
-rwxrwxrwx 1 apache apache 82 Sep 20 16:51 index.html
```

8. Cat out the content of the `index.html` file,

```
[root@stapp01 html]# cat index.html
Welcome to Nautilus Group!
This is a Nautilus sample file, created using Ansible!
```

9. Now, curl to localhost to check if httpd server is responding, 

```
[root@stapp01 html]# curl localhost
Welcome to Nautilus Group!
This is a Nautilus sample file, created using Ansible!
```

10. Same way, you can use curl from jump host and check that we are getting response from each app server,

```
hor@jump_host ~/ansible$ curl 172.16.238.10
Welcome to Nautilus Group!
This is a Nautilus sample file, created using Ansible!
thor@jump_host ~/ansible$ curl 172.16.238.11
Welcome to Nautilus Group!
This is a Nautilus sample file, created using Ansible!
thor@jump_host ~/ansible$ curl 172.16.238.12
Welcome to Nautilus Group!
This is a Nautilus sample file, created using Ansible!
```

Thank you.

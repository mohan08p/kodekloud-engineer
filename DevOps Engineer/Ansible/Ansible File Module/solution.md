#### Ansible File Module

1. Change directory to `playbook` and check the contents on jump box,

```
thor@jump_host /$ cd /home/thor/playbook/

thor@jump_host ~/playbook$ ls -ltr
total 0
```

2. Now, create an `inventory` file and add the hosts as below,

```
thor@jump_host ~/ansible$ vi inventory
stapp01 ansible_host=172.16.238.10 ansible_ssh_pass=Ir0nM@n ansible_user=tony
stapp02 ansible_host=172.16.238.11 ansible_ssh_pass=Am3ric@ ansible_user=steve
stapp03 ansible_host=172.16.238.12 ansible_ssh_pass=BigGr33n ansible_user=banner
```

3. Create a playbook `playbook.yml` for ansible configuration,

```
thor@jump_host ~/playbook$ vi playbook.yml
```
*NOTE: Refer the current directory for config file*

4. Now, run an ansible playbook, 

```
thor@jump_host ~/playbook$ ansible-playbook playbook.yml -i inventory

PLAY [Deploy playbook] ****************************************************************************************************************************************************************************************************************

TASK [Gathering Facts] ****************************************************************************************************************************************************************************************************************
ok: [stapp01]

TASK [Create empty file and add contents] *********************************************************************************************************************************************************************************************
changed: [stapp01]
TASK [Changing file owner and group permissions] **************************************************************************************************************************************************************************************
changed: [stapp01]

PLAY [Deploy playbook] ****************************************************************************************************************************************************************************************************************

TASK [Gathering Facts] ****************************************************************************************************************************************************************************************************************
ok: [stapp02]

TASK [Create empty file and add contents] *********************************************************************************************************************************************************************************************
changed: [stapp02]

TASK [Changing file owner and group permissions] **************************************************************************************************************************************************************************************
changed: [stapp02]

PLAY [Deploy playbook] ****************************************************************************************************************************************************************************************************************

TASK [Gathering Facts] ****************************************************************************************************************************************************************************************************************
ok: [stapp03]

TASK [Create empty file and add contents] *********************************************************************************************************************************************************************************************
changed: [stapp03]

TASK [Changing file owner and group permissions] **************************************************************************************************************************************************************************************
changed: [stapp03]

PLAY RECAP ****************************************************************************************************************************************************************************************************************************
stapp01                    : ok=3    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
stapp02                    : ok=3    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
stapp03                    : ok=3    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

5. Now to validate login to any of the app server and check the if the file present along with owner/group permissions,

```
[root@stapp01 tony]# cd /usr/src/

[root@stapp01 src]# ls -ltr
total 8
drwxr-xr-x 2 root root 4096 Apr 11  2018 kernels
drwxr-xr-x 2 root root 4096 Apr 11  2018 debug
-rwxrwxrwx 1 tony tony    0 Sep 27 18:00 app.txt
```

Thank you.

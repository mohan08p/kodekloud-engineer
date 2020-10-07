#### Ansible Unarchive Module

1. Change directory to `ansible` on jump host i.e. ansible control node,

```
thor@jump_host /$ cd /home/thor/ansible/
```

2. Check the inventory file mentioned app server hosts correctly,

```
thor@jump_host ~/ansible$ cat inventory
stapp01 ansible_host=172.16.238.10 ansible_ssh_pass=Ir0nM@n ansible_user=tony
stapp02 ansible_host=172.16.238.11 ansible_ssh_pass=Am3ric@ ansible_user=steve
stapp03 ansible_host=172.16.238.12 ansible_ssh_pass=BigGr33n ansible_user=banner
```

3. Now, create `playbook.yml` for writing ansible script,

```
thor@jump_host ~/ansible$ vi playbook.yml
```
*Note: Refer current directoy for config file*

4. Run the anisble playbook,

```
thor@jump_host ~/ansible$ ansible-playbook -i inventory playbook.yml

PLAY [Deploy playbook] ***********************************************************************************************************************

TASK [Gathering Facts] ***********************************************************************************************************************
ok: [stapp01]

TASK [unarchieve the zip on app server] ******************************************************************************************************
changed: [stapp01]

PLAY [Deploy playbook] ***********************************************************************************************************************

TASK [Gathering Facts] ***********************************************************************************************************************
ok: [stapp02]
TASK [unarchieve the zip on app server] ******************************************************************************************************
changed: [stapp02]

PLAY [Deploy playbook] ***********************************************************************************************************************

TASK [Gathering Facts] ***********************************************************************************************************************
ok: [stapp03]

TASK [unarchieve the zip on app server] ******************************************************************************************************
changed: [stapp03]

PLAY RECAP ***********************************************************************************************************************************
stapp01                    : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
stapp02                    : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
stapp03                    : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

5. Now, SSH to any app server node and verify the file is created correctly along with group/owner permissions,

```
[tony@stapp01 ~]$ cd /opt/security/

[tony@stapp01 security]$ ls -ltr
total 4
drwxr-xr-x 2 tony tony 4096 Oct  7 07:37 unarchive

[tony@stapp01 security]$ ls -ltr unarchive/
total 4
-rwxr-xr-x 1 tony tony 35 Oct  7 07:36 web.txt

[tony@stapp01 security]$ cat unarchive/web.txt
Welcome to xFusionCorp Industries !
```

Thank you.

#### Managing ACLs Using Ansible

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

PLAY [Deploy playbook] ****************************************************************************************************************************************************************************************************************

TASK [Gathering Facts] ****************************************************************************************************************************************************************************************************************
ok: [stapp02]
ok: [stapp01]
ok: [stapp03]

TASK [create empty file] **************************************************************************************************************************************************************************************************************
ok: [stapp02]
ok: [stapp01]ok: [stapp03]

TASK [set acl rules] ******************************************************************************************************************************************************************************************************************
changed: [stapp02]
changed: [stapp03]
changed: [stapp01]                                                                                                                            ['permissions'] }}"}
                                                                                                                                              ['permissions'] }}"}
PLAY RECAP ***********************************************************************************************************************************['permissions'] }}"}*****************************************************************************************
stapp01                    : ok=3    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
stapp02                    : ok=3    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
stapp03                    : ok=3    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

5. Now, SSH to any app server stapp01 and stapp02 node and verify the acl rules on this respective files,

```
On App server 01

[tony@stapp01 ~]$ cd /opt/security/
[tony@stapp01 security]$ ls -ltr
total 0
-rw-r--r--+ 1 root root 0 Oct 21 14:15 blog.txt
[tony@stapp01 security]$ getfacl blog.txt
# file: blog.txt
# owner: root
# group: root
user::rw-
group::r--
group:tony:r--
mask::r--
other::r--

On App server 02

[steve@stapp02 ~]$ cd /opt/security/
[steve@stapp02 security]$ ls -ltr
total 0
-rw-rw-r--+ 1 root root 0 Oct 21 14:15 story.txt
[steve@stapp02 security]$ getfacl story.txt
# file: story.txt
# owner: root
# group: root
user::rw-
user:steve:rw-
group::r--
mask::rw-
other::r--

```

Thank you.

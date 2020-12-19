#### Ansible Replace Module

1. Change directory to `ansible` location on control node i.e. jump server,

```
thor@jump_host /$ cd /home/thor/ansible/
```

2. Check the invenrory,

```
thor@jump_host ~/ansible$ cat inventory
stapp01 ansible_host=172.16.238.10 ansible_ssh_pass=Ir0nM@n ansible_user=tony
stapp02 ansible_host=172.16.238.11 ansible_ssh_pass=Am3ric@ ansible_user=steve
stapp03 ansible_host=172.16.238.12 ansible_ssh_pass=BigGr33n ansible_user=banner
```

3. Create a `playbook.yml` for the ansible configuration,

```
thor@jump_host ~/ansible$ vi playbook.yml
```
*Note: Refer current directoy for config file*

4. Run the ansible playbook,

```
thor@jump_host ~/ansible$ ansible-playbook -i inventory playbook.yml

PLAY [Deploy playbook] ****************************************************************************************************************************************************************************************************************

TASK [Gathering Facts] ****************************************************************************************************************************************************************************************************************
ok: [stapp02]ok: [stapp03]
ok: [stapp01]

TASK [Replace a line in file] *********************************************************************************************************************************************************************************************************
changed: [stapp03]
changed: [stapp01]
changed: [stapp02]

PLAY RECAP ****************************************************************************************************************************************************************************************************************************
stapp01                    : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
stapp02                    : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
stapp03                    : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

5 Now, login to each app server and check the files respectively to verify that string is replaced,

```
[tony@stapp01 ~]$ cd /opt/security/
[tony@stapp01 security]$ ls
blog.txt
[tony@stapp01 security]$ cat blog.txt
Welcome to Nautilus Industries !


[steve@stapp02 ~]$ cd /opt/security/
[steve@stapp02 security]$ ls
story.txt
[steve@stapp02 security]$ cat story.txt
Welcome to KodeKloud Group !


[banner@stapp03 ~]$ cd /opt/security/
[banner@stapp03 security]$ ls
media.txt
[banner@stapp03 security]$ cat media.txt
Welcome to xFusionCorp Industries !
```

Thank you.

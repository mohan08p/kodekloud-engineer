#### Ansible Blockinfile Module

1. Change directory to `ansible` dir,

```
thor@jump_host /$ cd /home/thor/ansible/
```

2. Check the inverory to verify that all application hosts mentioned,

```
thor@jump_host ~/ansible$ cat inventory
stapp01 ansible_host=172.16.238.10 ansible_ssh_pass=Ir0nM@n ansible_user=tony
stapp02 ansible_host=172.16.238.11 ansible_ssh_pass=Am3ric@ ansible_user=steve
stapp03 ansible_host=172.16.238.12 ansible_ssh_pass=BigGr33n ansible_user=banner
```

3. Create a `playbook.yml` and write the ansible script,

```
thor@jump_host ~/ansible$ vi playbook.yml
```
*NOTE: Check the current dir for the configs*

4. Run the ansible playbook,

```
thor@jump_host ~/ansible$ ansible-playbook -i inventory playbook.yml

PLAY [Deploy playbook] *******************************************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************************
ok: [stapp01]
TASK [Install httpd packages] ************************************************************************************************************
changed: [stapp01]

TASK [Ensure httpd is running] ***********************************************************************************************************
changed: [stapp01]

TASK [Create index.html file along with a block of text] *********************************************************************************
changed: [stapp01]

TASK [Changing file owner and group permissions] *****************************************************************************************
changed: [stapp01]

PLAY [Deploy playbook] *******************************************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************************
ok: [stapp02]

TASK [Install httpd packages] ************************************************************************************************************
changed: [stapp02]

TASK [Ensure httpd is running] ***********************************************************************************************************
changed: [stapp02]

TASK [Create index.html file along with a block of text] *********************************************************************************
changed: [stapp02]

TASK [Changing file owner and group permissions] *****************************************************************************************
changed: [stapp02]

PLAY [Deploy playbook] *******************************************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************************
ok: [stapp03]

TASK [Install httpd packages] ************************************************************************************************************
changed: [stapp03]

TASK [Ensure httpd is running] ***********************************************************************************************************
changed: [stapp03]

TASK [Create index.html file along with a block of text] *********************************************************************************
changed: [stapp03]

TASK [Changing file owner and group permissions] *****************************************************************************************
changed: [stapp03]

PLAY RECAP *******************************************************************************************************************************
stapp01                    : ok=5    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
stapp02                    : ok=5    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
stapp03                    : ok=5    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

5. Finally, you can verify from login to any of the application server and check it's content along with user/group permissions, respectively. Also, freom jump host, you can try to send request to apache web server and check if you could able to receive reply back,

```
thor@jump_host ~/ansible$ curl 172.16.238.10
# BEGIN ANSIBLE MANAGED BLOCK
Welcome to XfusionCorp!
This is Nautilus sample file, created using Ansible!
Please do not modify this file manually!
# END ANSIBLE MANAGED BLOCK

thor@jump_host ~/ansible$ curl 172.16.238.11
# BEGIN ANSIBLE MANAGED BLOCK
Welcome to XfusionCorp!
This is Nautilus sample file, created using Ansible!
Please do not modify this file manually!
# END ANSIBLE MANAGED BLOCK

thor@jump_host ~/ansible$ curl 172.16.238.12
# BEGIN ANSIBLE MANAGED BLOCK
Welcome to XfusionCorp!
This is Nautilus sample file, created using Ansible!
Please do not modify this file manually!
# END ANSIBLE MANAGED BLOCK
```

which confirms that we have configured it correctly.

Thank you.

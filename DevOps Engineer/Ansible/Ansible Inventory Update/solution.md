#### Ansible Inventory Update

1. Change directory to `playbook` on jump host i.e. ansible control node,

```
thor@jump_host /$ cd /home/thor/playbook/
```

2. Check the content of the directory,

```
thor@jump_host ~/playbook$ ls -ltr
total 8
-rw-r--r-- 1 thor thor 250 Nov 25 05:20 playbook.yml
-rw-r--r-- 1 thor thor  36 Nov 25 05:20 ansible.cfg
```

3. Create an inventory and add host as app server 3, after creating we can see the host as below,

```
thor@jump_host ~/playbook$ vi inventory

thor@jump_host ~/playbook$ cat inventory
stapp03 ansible_host=172.16.238.12 ansible_ssh_pass=BigGr33n ansible_user=banner
```

4. Also, check the playbook which is going to execute on target host,

```
thor@jump_host ~/playbook$ cat playbook.yml
---
- hosts: all
  become: yes
  become_user: root
  tasks:
    - name: Install httpd package
      yum:
        name: httpd
        state: installed

    - name: Start service httpd
      service:
        name: httpd
        state: started
```

5. We can execute the playbook as below and test,

```
thor@jump_host ~/playbook$ ansible-playbook -i inventory playbook.yml

PLAY [all] ***********************************************************************************************************************************
TASK [Gathering Facts] ***********************************************************************************************************************
ok: [stapp03]

TASK [Install httpd package] *****************************************************************************************************************
changed: [stapp03]

TASK [Start service httpd] *******************************************************************************************************************
changed: [stapp03]

PLAY RECAP ***********************************************************************************************************************************
stapp03                    : ok=3    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

Finally, you can verify if `httpd` service is running on app server 3.

Thank you.


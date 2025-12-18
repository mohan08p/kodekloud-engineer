#### Create Ansible Inventory for App Server Testing

1. Change directory to `playbook` on jump host i.e. ansible control node,

```
thor@jump_host /$ cd /home/thor/playbook/
```

2. Check the content of the directory,

```
thor@jumphost ~/playbook$ ls
ansible.cfg  playbook.yml
```

3. Now, create and add the below content to the inventory file, 

```
thor@jumphost ~/playbook$ vi inventory

stapp01 ansible_host=172.16.238.10 ansible_ssh_pass=Ir0nM@n ansible_user=tony
```

4. Valdiate the contents of the inventory file,

```
thor@jumphost ~/playbook$ cat inventory
stapp01 ansible_host=172.16.238.10 ansible_ssh_pass=Ir0nM@n ansible_user=tony
```

5. Check the contents of `playbook.yml`

```
thor@jumphost ~/playbook$ cat playbook.yml
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

6. Finally, execute the ansible playbook,

```
thor@jumphost ~/playbook$ ansible-playbook -i inventory playbook.yml

PLAY [all] *********************************************************************

TASK [Gathering Facts] *********************************************************
ok: [stapp01]

TASK [Install httpd package] ***************************************************
changed: [stapp01]

TASK [Start service httpd] *****************************************************
changed: [stapp01]

PLAY RECAP *********************************************************************
stapp01                    : ok=3    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0  
```


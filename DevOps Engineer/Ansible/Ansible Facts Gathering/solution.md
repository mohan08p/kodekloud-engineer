#### Ansible Facts Gathering

1. Change directory to `/home/thor/playbooks/` on jump host,

```
thor@jump_host /$ cd /home/thor/playbooks/
```

2. Create a file `index.yml` and write a playbook,

```
thor@jump_host ~/playbooks$ vi index.yml
Refer the index.yml file in the same directory
```

3. Now, run a playbook to deploy on all app servers,

```
thor@jump_host ~/playbooks$ ansible-playbook index.yml -i inventory
```

4. Finally, validate that by requesting hhttpd server on port 80 as shown below,

```
thor@jump_host ~/playbooks$ curl 172.16.238.10
# BEGIN ANSIBLE MANAGED BLOCK
Ansible managed node IP is 172.16.238.10
# END ANSIBLE MANAGED BLOCK
thor@jump_host ~/playbooks$ curl 172.16.238.11
# BEGIN ANSIBLE MANAGED BLOCK
Ansible managed node IP is 172.16.238.11
# END ANSIBLE MANAGED BLOCK
thor@jump_host ~/playbooks$ curl 172.16.238.12
# BEGIN ANSIBLE MANAGED BLOCK
Ansible managed node IP is 172.16.238.12
# END ANSIBLE MANAGED BLOCK
```

Thank you.

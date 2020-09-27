#### Ansible File Module

The Nautilus DevOps team is working to test several Ansible modules on servers in Stratos DC. Recently they wanted to test file creation on remote hosts using Ansible. More details about the task aregiven below. Please proceed with the same:

a. Create an inventory file ~/playbook/inventory on jump host and add all app servers in it.

b. Create a playbook ~/playbook/playbook.yml to create a blank file /usr/src/app.txt on all app servers.

c. The /usr/src/app.txt file permission must be 0777.

d. The user/group owner of file /usr/src/app.txt must be tony on app server 1, steve on app server 2 and banner on app server 3.

Note: Validation will try to run playbook using command ansible-playbook -i inventory playbook.yml, so please make sure playbook works this way, without passing any extra arguments.

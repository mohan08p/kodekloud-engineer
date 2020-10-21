#### Managing ACLs Using Ansible

There are some files that need to be created on all app servers in Stratos DC. The Nautilus DevOps team want these files to be owned by user root only; however, they also want that app-specific user to have a set of permissions to these files. All tasks must be done using Ansible only, so they need to create a playbook. Below you can find more information about the task.

Create a playbook.yml under /home/thor/ansible on jump host, an inventory file is already present under /home/thor/ansible on Jump Server itself.

    Create an empty file blog.txt under /opt/security/ directory on app server 1. Set some acl properties for this file. Using acl provide read '(r)' permissions to group tony (i.e entity is tony and etype is group).

    Create an empty file story.txt under /opt/security/ directory on app server 2. Set some acl properties for this file. Using acl provide read + write '(rw)' permissions to user steve (i.e entity is steve and etype is user).

    Create an empty file media.txt under /opt/security/ on app server 3. Set some acl properties for this file. Using acl provide read + write '(rw)' permissions to group banner (i.e entity is banner and etype is group).

Note: Validation will try to run playbook using command ansible-playbook -i inventory playbook.yml so please make sure playbook works this way, without passing any extra arguments.

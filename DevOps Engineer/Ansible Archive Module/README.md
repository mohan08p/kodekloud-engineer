####  Ansible Archive Module

The Nautilus DevOps team has some data on jump host in Stratos DC that they want to copy on all app servers in the same data center. However, they want to create an archive of data and copy it to the app servers. Additionally, there are some specific requirements for each server. Perform the task using Ansible playbook as per requirements mentioned below:

Create a playbook.yml under /home/thor/ansible on jump host, an inventory file is already placed under /home/thor/ansible/ on Jump Server itself.

    Create an archive blog.tar.gz (make sure archive format is tar.gz) of /usr/src/data/ directory ( present on each app server ) and copy it to /opt/data/ directory on all app servers. The user and group owner of archive blog.tar.gz should be tony for App Server 1, steve for App Server 2 and banner for App Server 3.

Note: Validation will try to run playbook using command ansible-playbook -i inventory playbook.yml so please make sure playbook works this way, without passing any extra arguments.

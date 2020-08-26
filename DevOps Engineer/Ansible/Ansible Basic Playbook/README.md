#### Ansible Basic Playbook

One of the Nautilus DevOps team members was working on to test an Ansible playbook on jump host. However, he was only able to create the inventory, and due to other priorities that came in he must work on other tasks. Please pick up this task from where he left off and complete it. Below are more details about the task:


The inventory file /home/thor/ansible/inventory seems to be having some issues; please fix them. The playbook needs to be run on App Server 3 in Stratos DC, so inventory file needs to be updated accordingly.

Create a playbook /home/thor/ansible/playbook.yml and add a task to create an empty file /tmp/file.txt on App Server 3.

Note: Validation will try to run playbook using command ansible-playbook -i inventory playbook.yml so please make sure playbook works this way, without passing any extra arguments.

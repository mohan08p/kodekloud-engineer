#### Ansible Replace Module

here is data on all app servers in Stratos DC. The Nautilus development team shared some requirement with the DevOps team to alter some of the data as per recent changes. The DevOps team is working to prepare an Ansible playbook to accomplish the same. Below you can find more details about the task.

Create a playbook.yml under /home/thor/ansible on jump host; an inventory is already place under /home/thor/ansible on Jump host itself.

    We have a file /opt/security/blog.txt on app server 1. Using Ansible replace module replace string xFusionCorp to Nautilus in that file.

    We have a file /opt/security/story.txt on app server 2. Using Ansiblereplace module replace string Nautilus to KodeKloud in that file.

    We have a file /opt/security/media.txt on app server 3. Using Ansible replace module replace string KodeKloud to xFusionCorp Industries in that file.

Note: Validation will try to run playbook using command ansible-playbook -i inventory playbook.yml so please make sure playbook works this way, without passing any extra arguments.


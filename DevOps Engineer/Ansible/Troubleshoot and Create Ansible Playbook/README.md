#### Troubleshoot and Create Ansible Playbook

An Ansible playbook needs completion on the jump host, where a team member left off. Below are the details:

The inventory file /home/thor/ansible/inventory requires adjustments. The playbook must run on App Server 3 in Stratos DC. Update the inventory accordingly.

Create a playbook /home/thor/ansible/playbook.yml. Include a task to create an empty file /tmp/file.txt on App Server 3.

Note: Validation will run the playbook using the command ansible-playbook -i inventory playbook.yml. Ensure the playbook works without any additional arguments.
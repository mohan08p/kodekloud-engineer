#### Managing Jinja2 Templates Using Ansible

One of the Nautilus DevOps team members is working to develop a role for httpd installation and configuration. Work is almost completed, however there is a requirement to add a jinja2 template for index.html file. Additionally, the relevant task needs to be added inside the role. The inventory file ~/ansible/inventory is already present on jump host that can be used. Complete the task as per details mentioned below:


a. Update ~/ansible/playbook.yml playbook to run the httpd role on App Server 1.

b. Create a jinja2 template index.html.j2 under /home/thor/ansible/role/httpd/templates/ and add a line This file was created using Ansible on <respective server> (for example This file was created using Ansible on stapp01 in case of App Server 1). Also please make sure not to hard code the server name inside the template. Instead, use inventory_hostname variable to fetch the correct value.

c. Add a task inside /home/thor/ansible/role/httpd/tasks/main.yml to copy this template on App Server 1 in /var/www/html/index.html. Also make sure that /var/www/html/index.html file permissions 0755.

d. The user/group owner of /var/www/html/index.html file must be respective sudo user of server (for example tony in case of stapp01).

Note: Validation will try to run playbook using command ansible-playbook -i inventory playbook.yml so please make sure playbook works this way, without passing any extra arguments.

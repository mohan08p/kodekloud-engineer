####  Ansible Ping Module Usage 

Nautilus DevOps team is planning to test some Ansible playbooks on different app servers in Stratos DC. Before make them work they need to complete some pre-requisites. Basically team need to setup password less SSH connection between Ansible controller and Ansible managed nodes. Among other tickets one of them is assigned to you, please complete the task as per details mentioned below:

a. Jump host is our Ansible controller and we are going to run Ansible playbooks through thor user on jump host.

b.Make appropriate changes on jump host so that user thor on jump host can SSH into app server 2 through its respective sudo user. (for example tony for app server 1).

c. There is an inventory file /home/thor/ansible/inventory on jump host. Using that inventory file test Ansible ping from jump host to app server 2, make sure ping works.

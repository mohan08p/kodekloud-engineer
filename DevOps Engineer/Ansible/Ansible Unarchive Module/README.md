#### Ansible Unarchive Module

One of the DevOps team members has created a ZIP archive on jump host in Stratos DC that needs to be extracted and copied over to all app servers in Stratos DC itself. Because this is a routine task, the Nautilus DevOps team has suggested automating it. We can use Ansible since we have been using it for other automating tasks. Below you can find more details about the task:

We have an inventory file under /home/thor/ansible on jump host, which should have all the app servers added already.

There is a ZIP archive /usr/src/security/datacenter.zip on jump host.

Create a playbook.yml under /home/thor/ansible/ on jump host itself to perform the following tasks.

    Unzip /usr/src/security/datacenter.zip archive in /opt/security/ location on all app servers.

    Make sure the unzipped data must has the respective sudo user as their user and group owner, i.e tony for app server 1, steve for app server 2, banner for app server 3.

    The extracted data permissions must be 0755

Note: Validation will try to run playbook using command ansible-playbook -i inventory playbook.yml so please make sure playbook works this way, without passing any extra arguments.

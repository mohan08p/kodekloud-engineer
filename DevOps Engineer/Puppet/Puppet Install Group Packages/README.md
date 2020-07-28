#### Puppet Install Group Packages

Some new packages need to be installed on all app servers in Stratos DC. Basically Nautilus DevOps team is trying to install some group packages which they want to install using Puppet. Team was working on to develop some Puppet manifests to accomplish the same. Please find below the details of task and complete the same accordingly:


Create a puppet programming file official.pp under /etc/puppetlabs/code/environments/production/manifests directory on puppet master node i.e on Jump Server. Define a class yum_group in puppet programming code and using puppet yum group resource complete the task as per details mentioned below:

First of all Install puppet module named puppet-yum on puppet master node i.e on Jump Server (this needs to be done manually).

Install group package Security Tools on all puppet agent nodes i.e on all App Servers using your programming file.

Note: Please perform this task using official.pp only, do not create any separate inventory file.

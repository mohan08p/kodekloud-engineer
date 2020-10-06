#### Puppet Add Users

As a new teammate has joined Nautilus application development team, the application development team has asked the DevOps team to create a new user for the new teammate on all application servers in Stratos Datacenter. The task needs to be performed using Puppet only. You can find more details below about the task.

Create a Puppet programming file cluster.pp under /etc/puppetlabs/code/environments/production/manifests directory on master node i.e Jump Server, and using Puppet user resource add a user on all app servers as mentioned below:

    Create a user ammar and set its UID to 1199 on all Puppet agent nodes i.e all App Servers.

Note: Please perform this task using cluster.pp only, do not create any separate inventory file.

#### Puppet Setup File Permissions

The Nautilus DevOps team has put data on all app servers in Stratos DC. jump host is configured as Puppet master server, and all app servers are already been configured as Puppet agent nodes. The team needs to update content of some of the exiting files as well as update its permissions, etc. Please find below more details about the task:

Create a Puppet programming file news.pp under /etc/puppetlabs/code/environments/production/manifests directory on master node i.e Jump Server. Using puppet file resource, perform the below mentioned tasks.

    File beta.txt already exists under /opt/sysops directory on App Server 3.

    Add content Welcome to xFusionCorp Industries! in file beta.txt on App Server 3.

    Set permissions 0744 for file beta.txt on App Server 3.

Note: Please perform this task using news.pp only, do not create any separate inventory file.

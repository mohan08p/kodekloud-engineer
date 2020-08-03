#### Puppet Create a FIle

The Puppet master and Puppet agent nodes have been set up by the Nautilus DevOps team so they can perform testing. In Stratos DC all app servers have been configured as Puppet agent nodes. Below are details about the testing scenario they want to proceed with.


Use Puppet file resource and perform the task below:

Create a Puppet programming file cluster.pp under /etc/puppetlabs/code/environments/production/manifests directory on master node i.e Jump Server.

Using /etc/puppetlabs/code/environments/production/manifests/cluster.pp create a file ecommerce.txt under /opt/sysops directory on App Server 2.

Note: Please perform this task using official.pp only, do not create any separate inventory file.


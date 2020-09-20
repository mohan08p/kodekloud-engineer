#### Puppet Setup SSH Keys

The Puppet master and Puppet agent nodes have been set up by the Nautilus DevOps team so they can perform testing. In Stratos DC all app servers have been configured as Puppet agent nodes. They want to setup a password less SSH connection between puppet master and puppet agent nodes and this task needs to be done using puppet itself. Below are details about the task:

Create a puppet programming file official.pp under /etc/puppetlabs/code/environments/production/manifests directory on puppet master node i.e on Jump Server. Define a class ssh_node1 for agent node 1 i.e app server 1, ssh_node2 for agent node 2 i.e app server 2, ssh_node3 for agent node3 i.e app server 3. We already have a default ssh key under location /root/.ssh/ on Jump Server that needs to be added on all app servers.

Configure a password less SSH connection from puppet master i.e jump host to all app servers. However make sure key is added to each app's sudo user (i.e tony for app server 1)

Note: Create a single puppet programming code official.pp for above mentioned tasks.

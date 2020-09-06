#### Puppet Setup Firewall Rules

The Nautilus DevOps team was auditing some of the applications running on all app servers in Stratos Datacenter. They found some security loop holes like they observed there is no firewall installed on these apps. So team has decided to install firewalld on all app servers and also some rules need to be added. This task needs to be done using Puppet so as per details mentioned below please compete the task:

Create an inventory file site.pp under /etc/puppetlabs/code/environments/production/manifests directory on puppet master node i.e on Jump Server. In this inventory file you need to define nodes specific classes only which are mentioned below.

    Define a class firewall_node1 for agent node 1 i.e app server 1, firewall_node2 for agent node 2 i.e app server 2, firewall_node3 and for agent node3 i.e app server

Also create a puppet programming file official.pp under /etc/puppetlabs/code/environments/production/manifests directory on puppet master node i.e on Jump Server and write code to perform below mention task.

    Install puppet firewall module on master node i.e on Jump Server (you can install manually).

    There are some different applications running on all three apps. One of the application is using port 5000 on App server 1 , 9006 on App server 2 and 8092 on App server 3. Complete below mentioned tasks:

a. Open all incoming connection for 5000/tcp port on App Server 1 and zone should be public.

b. Open all incoming connection for 9006/tcp port on App Server 2 and zone should be public.

c. Open all incoming connection for 8092/tcp port on App Server 3 and zone should be public.

Note: Please do not add firewall rich rules.

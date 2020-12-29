#### Install Puppet Server

The Nautilus DevOps team started experimenting with the Puppet server to manage some of their infrastructure in Stratos DC. For testing different scenarios, the team will be using jump host as puppet master. At this point we just need to install puppet server package and ensure its service is up and running. Below you can find more details about the task.


1. Install puppetserver package on jump host and start its service.
2. Before starting puppetserver service, you might need to change its memory allocation configuration. We recommend to allocating it 512m of memory.
Note: Please make sure to install puppetserver package only not any other alternate package.

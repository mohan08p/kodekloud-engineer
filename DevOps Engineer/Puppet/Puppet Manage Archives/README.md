#### Puppet Manage Archives

The Nautilus DevOps team has zipped data on all app servers in Stratos DC that they want to extract to all app servers in the same data center. However, they want to extract that data in a different directory in the app servers. Perform the task using a Puppet programming file as per requirements mentioned below:


Create a puppet programming file beta.pp under /etc/puppetlabs/code/environments/production/manifests on master node i.e on Jump Server. Using Puppet, archive resource and perform the tasks below:

There is a zip archive /usr/src/beta/beta.zip on all app servers. Unzip the archive to location /opt/beta on each app server.

Note: Please perform this task using beta.pp only, do not create any separate inventory file.

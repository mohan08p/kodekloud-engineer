#### Puppet String Manipulation

There is some data on app server 2 in Stratos DC. The Nautilus development team shared some requirement with the DevOps team to alter some of the data as per recent changes. The DevOps team is working to prepare a Puppet programming file to accomplish the same. Below you can find more details about the task.

Create a puppet programming file cluster.pp under /etc/puppetlabs/code/environments/production/manifests directory on puppet master node i.e Jump Server and by using puppet file_line resource perform below mentioned tasks.

    We have a file /opt/itadmin/cluster.txt on App Server 2. Use above mentioned puppet programming file to replace line Welcome to Nautilus Industries! to Welcome to xFusionCorp Industries!, no other data should be altered in this file.

Note: Please perform this task using cluster.pp only, do not create any separate inventory file.

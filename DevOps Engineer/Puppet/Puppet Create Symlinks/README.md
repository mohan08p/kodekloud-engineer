#### Puppet Create Symlinks

There are directory structures in the Stratos Datacenter that need to be changed, including directories that need to be linked to the default Apache document root. We need to accomplish this task using only Puppet as per the instructions given below:

Create a puppet programming file cluster.pp under /etc/puppetlabs/code/environments/production/manifests directory on puppet master node i.e on Jump Server. Within that define a class symlink and perform below mentioned tasks:

    Create a symbolic link through puppet programming code. The source path should be /opt/finance and destination path should be /var/www/html on all Puppet agents i.e on all App Servers.

    Create a blank file blog.txt under /opt/finance directory on all puppet agent nodes i.e on all App Servers.

Note: Please perform this task using cluster.pp only, do not create any separate inventory file.

#### Puppet Setup Local Yum Repos

The Nautilus DevOps team was working on developing some custom RPMs to meet some application needs. Most of those RPMs will be installed on all application servers in Stratos Datacenter. So to accomplish this task we need to configure a local yum repository on all app servers so that we can install those custom RPMs from that local yum repository. But this task needs to be done using Puppet, below you can find more details.

Create a puppet programming file official.pp under /etc/puppetlabs/code/environments/production/manifests directory on master node i.e on Jump Server. Define a class local_yum_repo and perform below mentioned tasks:

    There are some RPMs already present at location /packages/downloaded_rpms on all puppet agent nodes i.e on all App Servers.

    Create a local yum repository named epel_local (make sure to set Repository ID to epel_local). Configure it to use packages location /packages/downloaded_rpms on all puppet agent nodes i.e on all App Servers.

    Install package vsftpd from this newly created repository through on all puppet agent nodes i.e on all App Servers.

    Make sure to create a single puppet programming file official.pp to configure local yum repository and install the package.

Note: Please perform this task using official.pp only, do not create any separate inventory file.

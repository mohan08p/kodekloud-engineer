#### Puppet Setup Database

The Nautilus DevOps team had a meeting with development team last week to discuss about some new requirements for an application deployment. Team is working on to setup a mariadb database server on Nautilus DB Server in Stratos Datacenter. They want to setup the same using Puppet. Below you can find more details about the requirements:


Create a puppet programming file demo.pp under /etc/puppetlabs/code/environments/production/manifests directory on puppet master node i.e on Jump Server. Define a class mysql_database in puppet programming code and perform below mentioned tasks:

Install package mariadb-server (whichever version is available by default in yum repo) on puppet agent node i.e on DB Server also start its service.

Create a database kodekloud_db8 , a database userkodekloud_cap and set passwordGyQkFRVNr3 for this new user also remember host should be localhost. Finally grant full permissions to this newly created user on newly created database.

Make sure to create single puppet programming file demo.pp to do these all tasks.

#### Puppet Install Group Packages

In this task, we need to install Security tools on all app servers resepctively. On jump server, change directory to `/etc/puppetlabs/code/environments/production/manifests` location where even we generally keep all our puppet scripts.

On Jump host, change directory to location,

    cd /etc/puppetlabs/code/environments/production/manifests

Also, check which packages will get installed with this Security Tools usign the command,

    yum groups info "Security Tools"

Next install puppet-yum package using a command, as we will install the respective packages using Yum.

    puppet module install puppet-yum

Created a file `official.pp` where we define a class `yum_group` and declare it for execution.

Then, validate the code file using a command,

    puppet parser validate official.pp

Run it with noop and without noop,

    puppet apply official.pp --noop

    puppet apply official.pp

To check if agent is able to connect with puppet master, from App server nodes,

    puppet agent -tv --noop
    puppet agent -tv

Finally verify that the group is installed correctly,

    [root@stapp01 tony]# yum group summary | grep Installed
    Installed Groups: 1

Thank you.

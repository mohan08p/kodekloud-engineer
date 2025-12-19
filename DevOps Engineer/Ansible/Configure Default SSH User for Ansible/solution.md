#### Configure Default SSH User for Ansible

1. Login to the root on the jump server,

```
thor@jumphost ~$ sudo su -

We trust you have received the usual lecture from the local System
Administrator. It usually boils down to these three things:

    #1) Respect the privacy of others.
    #2) Think before you type.
    #3) With great power comes great responsibility.

[sudo] password for thor: 
[root@jumphost ~]#
```

2. Now, add `remote_user = ammar` to the ansible default configuration file,

```
[root@jumphost ~]# vi /etc/ansible/ansible.cfg
```

3. Validate the added configuration,

```
[root@jumphost ~]# cat /etc/ansible/ansible.cfg 
# Since Ansible 2.12 (core):
# To generate an example config file (a "disabled" one with all default settings, commented out):
#               $ ansible-config init --disabled > ansible.cfg
#
# Also you can now have a more complete file by including existing plugins:
# ansible-config init --disabled -t all > ansible.cfg

# For previous versions of Ansible you can check for examples in the 'stable' branches of each version
# Note that this file was always incomplete  and lagging changes to configuration settings

# for example, for 2.9: https://github.com/ansible/ansible/blob/stable-2.9/examples/ansible.cfg
[defaults]
host_key_checking = False
remote_user = ammar
```


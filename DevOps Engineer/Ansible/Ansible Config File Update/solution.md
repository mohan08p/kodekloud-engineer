#### Ansible Config File Update

1. As define in the problem statement, we need to achieve using ansible's default configuration itself. Change directory to `/etc/ansible`,

```
hor@jump_host /$ cd /etc/ansible/
```

2. Open `ansible.cfg` configuration file, and change the value of remote_user to mark as mentioned in the problem statement, as shown below,

```
thor@jump_host /etc/ansible$ vi ansible.cfg

...
# default user to use for playbooks if user is not specified
# (/usr/bin/ansible will use current user as default)
remote_user = mark

...
```

Thanks.

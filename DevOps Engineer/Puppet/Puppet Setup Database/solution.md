#### Puppet Setup Database

1. On jump host server, change directory to manifest, 

```
cd /etc/puppetlabs/code/environments/production/manifests
```

2. Start writing puppet programming file name `demo.pp`,

```
vi demo.pp

#### Refer current directory file demo.pp for a script
```

3. Validate the code file using a command,

```
puppet parser validate demo.pp
```

4. SSH to DB server and run it with noop and without noop,

```
puppet apply demo.pp --noop

puppet apply demo.pp
```

5. Finally, validate by getting a mysql shell, 

```
[root@stdb01 peter]# mysql -u kodekloud_cap -p kodekloud_db8 -h localhost
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 28
Server version: 5.5.65-MariaDB MariaDB Server

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [kodekloud_db8]>
```

Thank you.

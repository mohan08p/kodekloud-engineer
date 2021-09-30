#### Creating Soft Links Using Ansible

Create a `playbook.yml` as created in the same directory,

Execute it and validate as given here,

Dry-run 
    ansible-playbook playbook.yml -i inventory --check
Actual execution
    ansible-playbook playbook.yml -i inventory

SSH to one of the app server and verify that the file got created correctly as shown below,

    [tony@stapp01 itadmin]$ ls -ltr
    total 0
    -rw-r--r-- 1 tony tony 0 Jul 11 14:35 blog.txt

And, finally validate the symbolic link created correctly,

    [tony@stapp01 itadmin]$ cd /var/www/html/
    [tony@stapp01 html]$ ls -ltr
    total 0
    -rw-r--r-- 1 tony tony 0 Jul 11 14:35 blog.txt
    [tony@stapp01 html]$ cd ..
    [tony@stapp01 www]$ ls -ltr
    total 0
    lrwxrwxrwx 1 root root 12 Jul 11 14:35 html -> /opt/itadmin

Thank you.

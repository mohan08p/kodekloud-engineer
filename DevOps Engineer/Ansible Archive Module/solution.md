####  Ansible Archive Module

Here, Created a `playbook.yml` file. You can refer it and run the same to achieve the result.

You can run above playbook file using a command,

    ansible-playbook -i inventory playbook.yml

Finally you can verify on app server that gz file is created and it's user and owner permissions,

    [tony@stapp01 data]$ ls -ltr
    total 4
    -rwxr-xr-x 1 tony tony 162 Jul 20 12:51 blog.tar.gz

Thank you.

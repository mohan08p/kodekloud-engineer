#### Managing Jinja2 Templates Using Ansible

Change directory to ansible home,

    cd ~/ansible

First we need to update the main playbook file `playbook.yml` to run the httpd role, make sure to add hosts to `stapp01` as we are targeting on specific app server i.e. app server1.

    vi playbook.yml

    # Check playbook.yml in the same directory

Now create a jinja template file `index.html.j2` insides templates and add a line as below,

    vi role/httpd/templates/index.html.j2
    This file was created using Ansible on {{ inventory_hostname }}

Now add a task into role so that that template will get copied when we run a playbook. This task will use a ansible template module and we will set a owner and group respectively along with file permissions.

    vi role/httpd/tasks/main.yml

    # Check main.yml in the same directory

Thank you.

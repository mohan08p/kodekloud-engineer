#### Ansible Setup Httpd and PHP

1. Change directory to `ansible` on jump host i.e. ansible control node,

```
thor@jump_host /$ cd /home/thor/ansible/
```

2. Check the inventory file mentioned app server hosts correctly,

```
thor@jump_host ~/ansible$ cat inventory
stapp01 ansible_host=172.16.238.10 ansible_ssh_pass=Ir0nM@n ansible_user=tony
stapp02 ansible_host=172.16.238.11 ansible_ssh_pass=Am3ric@ ansible_user=steve
stapp03 ansible_host=172.16.238.12 ansible_ssh_pass=BigGr33n ansible_user=banner
```

3. Now, create `httpd.yml` for writing ansible script,

```
thor@jump_host ~/ansible$ vi httpd.yml
```
*Note: Refer current directoy for config file*

4. Run the anisble playbook,

```
thor@jump_host ~/ansible$ ansible-playbook -i inventory httpd.yml
PLAY [Deploy playbook] ****************************************************************************************************************************************************************************************************************

TASK [Gathering Facts] ****************************************************************************************************************************************************************************************************************
ok: [stapp01]

TASK [Install httpd and php package] **************************************************************************************************************************************************************************************************
[DEPRECATION WARNING]: Invoking "yum" only once while using a loop via squash_actions is deprecated. Instead of using a loop to supply multiple items and specifying `name: "{{ item }}"`, please use `name: ['httpd', 'php']` and
remove the loop. This feature will be removed in version 2.11. Deprecation warnings can be disabled by setting deprecation_warnings=False in ansible.cfg.
changed: [stapp01] => (item=[u'httpd', u'php'])

TASK [check the myroot is present or not] *********************************************************************************************************************************************************************************************
ok: [stapp01]

TASK [create a root dir myroot] *******************************************************************************************************************************************************************************************************
changed: [stapp01]

TASK [change default document root in apache config] **********************************************************************************************************************************************************************************
changed: [stapp01]

TASK [copy the php template to target node] *******************************************************************************************************************************************************************************************
changed: [stapp01]

TASK [ensure httpd is running] ********************************************************************************************************************************************************************************************************
changed: [stapp01]

PLAY RECAP ****************************************************************************************************************************************************************************************************************************
stapp01                    : ok=7    changed=5    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

5. Now, SSH to any app server stapp01 node and verify the apache installation and configs, respectively,

```
[root@stapp01 tony]# cd /var/www/html/
[root@stapp01 html]# ls -ltr
total 4
drwxr-xr-x 2 apache apache 4096 Nov  8 07:07 myroot
[root@stapp01 html]# cd myroot/
[root@stapp01 myroot]# ls -ltr
total 4
-rwxr-xr-x 1 apache apache 19 Nov  8 07:07 phpinfo.php
```

6. Also, check the default `DocumentRoot` in apache config,

```
[root@stapp01 myroot]# cat /etc/httpd/conf/httpd.conf  | grep -i "DocumentRoot"
# DocumentRoot: The directory out of which you will serve your
DocumentRoot /var/www/html/myroot
    # access content that does not live under the DocumentRoot.
```

7. Check with curl api call to the apache server,

```
thor@jump_host ~/playbooks$ curl 172.16.238.10
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd"><html><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
                <title>Apache HTTP Server Test Page powered by CentOS</title>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <!-- Bootstrap -->
    <link href="/noindex/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="noindex/css/open-sans.css" type="text/css" />

<style type="text/css"><!--
...
...
```

Thank you.

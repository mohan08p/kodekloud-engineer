#### Creating Soft Links Using Ansible

Write a `playbook.yml` as shown below,


    ---
    - name: Deploy playbook
      hosts: all  
      serial: 1
      any_errors_fatal: true
      gather_facts: true
      become: true  
      tasks:
        - name: create an empty file on app server1
          file:        
            path: /opt/itadmin/blog.txt
            state: touch
            group: tony
            owner: tony        
            mode: '0644'
          when: inventory_hostname == "stapp01"

        - name: create an empty file on app server2      
          file:
            path: /opt/itadmin/story.txt
            state: touch
            group: steve        
            owner: steve
            mode: '0644'
          when: inventory_hostname == "stapp02"

        - name: create an empty file on app server3
          file:
            path: /opt/itadmin/media.txt
            state: touch        
            group: banner
            owner: banner
            mode: '0644'
          when: inventory_hostname == "stapp03"

        - name: create symbolic link on app server1
          file:
            src: /opt/itadmin
            dest: /var/www/html
            state: link

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

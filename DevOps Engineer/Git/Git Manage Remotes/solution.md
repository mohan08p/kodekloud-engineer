#### Git Manage Remotes

SSH to Storage server and change directory to `/usr/src/kodekloudrepos/apps` using the follwong command,

    cd /usr/src/kodekloudrepos/apps

Now as mentioned into sub-task 1, add an rmeote named dev_apps and point it to `/opt/xfusioncorp_apps.git` using a command,

    git remote add dev_apps /opt/xfusioncorp_apps.git

Validate that a remote has been added successfully using remote command, 

    [root@ststor01 apps]# git remote -v
    dev_apps        /opt/xfusioncorp_apps.git (fetch)dev_apps        /opt/xfusioncorp_apps.git (push)
    origin  /opt/apps.git (fetch)
    origin  /opt/apps.git (push)

Copy the `index.html` file as mentioned into sub-task 2,

    [root@ststor01 apps]# cp /tmp/index.html .

Add it to git and commit respectively,

    [root@ststor01 apps]# git add index.html
    [root@ststor01 apps]# git commit -m "added index.html"

As mentioned in sub-task 3, push this change to new remote that we have added in the above named `dev_apps`, 

    [root@ststor01 apps]# git push dev_apps master
    Counting objects: 6, done.
    Delta compression using up to 2 threads.
    Compressing objects: 100% (4/4), done.
    Writing objects: 100% (6/6), 583 bytes | 0 bytes/s, done.
    Total 6 (delta 0), reused 0 (delta 0)
    To /opt/xfusioncorp_apps.git
    * [new branch]      master -> master

Thank you.




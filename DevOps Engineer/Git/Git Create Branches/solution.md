#### Git Create Branches

SSH to storage server and change directory to `/usr/src/kodekloudrepos/beta` location,

    cd /usr/src/kodekloudrepos/beta

First check which branch you are currently in using status command,

    [root@ststor01 beta]# git status
    # On branch kodekloud_beta
    nothing to commit, working directory clean

Now, as mentioned create a branch named `xfusioncorp_beta` from master branch,

    git checkout master
    git checkout -b xfusioncorp_beta

Again, verify that you have checkout to the new branch as below,

    [root@ststor01 beta]# git status
    # On branch xfusioncorp_beta
    nothing to commit, working directory clean

Thanks.

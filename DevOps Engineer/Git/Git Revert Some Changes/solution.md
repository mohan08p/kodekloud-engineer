#### Git Revert Some Changes

SSH to Storage server and change a directory to `official`,

    [root@ststor01 natasha]# cd /usr/src/kodekloudrepos/official/

Check git status using the command, 

    [root@ststor01 official]# git status
    # On branch master
    # Untracked files:
    #   (use "git add <file>..." to include in what will be committed)
    #
    #       official.txt
    nothing added to commit but untracked files present (use "git add" to track)

Check the git log before reverting to a previous commit using a command,

    [root@ststor01 official]# git log --oneline
    0472928 add data.txt file
    1668044 initial commit

Now, revert it to a previous commit using HEAD pointing to previous reference,

    [root@ststor01 official]# git revert HEAD
    [master f9ce5d2] Revert "revert official" 1 file changed, 1 insertion(+)
    create mode 100644 info.txt

NOTE: It will prompt for a commit message, enter *revert official* in there.

Finally, verify that commit message using git log command,

    [root@ststor01 official]# git log --oneline
    f9ce5d2 Revert "revert official"
    0472928 add data.txt file
    1668044 initial commit

Thanks.

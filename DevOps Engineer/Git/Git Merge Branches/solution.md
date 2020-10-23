#### Git Merge Branches

1. SSH to storage server and change directory to `apps`,

```
[root@ststor01 natasha]# cd /usr/src/kodekloudrepos/apps/
```

2. Check the `git status`,

```
[root@ststor01 apps]# git status
# On branch master
nothing to commit, working directory clean
```

3. Create a new branch named `devops` and check git status,

```
[root@ststor01 apps]# git checkout -b devops
Switched to a new branch 'devops'


[root@ststor01 apps]# git status
# On branch devops
nothing to commit, working directory clean
```

4. Copy `index.html` from tmp to current directory,

```
[root@ststor01 apps]# cp /tmp/index.html .
```

5. Add index.html file in git staging area and check git status,

```
[root@ststor01 apps]# git add index.html

[root@ststor01 apps]# git status
# On branch devops
# Changes to be committed:
#   (use "git reset HEAD <file>..." to unstage)#
#       new file:   index.html
#
```

6. Do the git commit for the added file,

```
[root@ststor01 beta]# git commit -m "index.html file added"
[nautilus 716859c] index.html file added
 1 file changed, 1 insertion(+)
 create mode 100644 index.html
```

7. Now, while while `git push` you might face issue along with warning set config, set them as below,
 
```
git config --global push.default matching
git config --global push.default simple
```

8. Now, push to origin remote branch of devops,

```
[[root@ststor01 apps]# git push --set-upstream origin devops
Counting objects: 4, done.
Delta compression using up to 2 threads.
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 334 bytes | 0 bytes/s, done.
Total 3 (delta 0), reused 0 (delta 0)
To /opt/apps.git
 * [new branch]      devops -> devops
Branch devops set up to track remote branch devops from origin.
```

9. Checkout to `master` branch again,

```
[root@ststor01 apps]# git checkout master
Switched to branch 'master'
```

10. Now, go merge a branch `devops` to master

```
[root@ststor01 apps]# git merge devops
Updating f7eb819..e3733a3
Fast-forward
 index.html | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 index.html
```

11. Finally, push the changes to origin master branch.

```
[root@ststor01 apps]# git push origin master
Total 0 (delta 0), reused 0 (delta 0)
To /opt/apps.git
   f7eb819..e3733a3  master -> master
```

Thank you.

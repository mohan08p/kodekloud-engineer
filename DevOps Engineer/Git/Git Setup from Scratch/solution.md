#### Git Setup from Scratch

1. SSH to storage server and install git using the following command,

```
yum install git -y
```

2. Set up git config with your username and email id using the following command,

```
git config --global user.email 'mohanpawary1990@gmail.com'
git config --global user.name 'Mohan Pawar'
```

3. Now, create a git bare repository `/opt/blog.git` using git init command,

```
git init --bare /opt/blog.git
```

4. Use the update hook given at location `/tmp/update` and copy it insides `hooks` directroy of your git repo.

```
cd /opt/blog.git/hooks
cp /tmp/update .
```

5. Clone the git repo in `/usr/src/kodekloudrepos` location. *NOTE: Check this directory is correct or /blog ahead of it*,

```
git clone /opt/blog.git /usr/src/kodekloudrepos
```

6. Create a new branch `xfusioncorp_blog` in the cloned rpeo, copy readme.md file and commit accordingly as shown below,

```
cd /usr/src/kodekloudrepos/
git checkout -b xfusioncorp_blog

cp /tmp/readme.md /usr/src/kodekloudrepos/
git add readme.md

[root@ststor01 kodekloudrepos]# git commit -m "added readme"
[xfusioncorp_blog (root-commit) 06fd309] added readme
1 file changed, 1 insertion(+)
create mode 100644 readme.md
```

7. Now push the changes to origin branch ,

```
root@ststor01 kodekloudrepos]# git push --set-upstream origin  xfusioncorp_blog
Counting objects: 3, done.
Writing objects: 100% (3/3), 251 bytes | 0 bytes/s, done.
Total 3 (delta 0), reused 0 (delta 0)
To /opt/blog.git
 * [new branch]      xfusioncorp_blog -> xfusioncorp_blog
Branch xfusioncorp_blog set up to track remote branch xfusioncorp_blog from origin.
```

8. Now create a master from this branch as shown below,

```
[root@ststor01 kodekloudrepos]# git checkout -b master
Switched to a new branch 'master'
```

9. Now, you can validate that we can not push any changes to master branch directly as we have set up an update hook,

```
[root@ststor01 kodekloudrepos]# git push --set-upstream origin master
Total 0 (delta 0), reused 0 (delta 0)
remote: Manual pushing to this repo's master branch is restricted
remote: error: hook declined to update refs/heads/master
To /opt/blog.git
 ! [remote rejected] master -> master (hook declined)
error: failed to push some refs to '/opt/blog.git'
```

Thank you.

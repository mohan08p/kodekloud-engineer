#### Resolve Git Merge Conflicts

1. SSH to storage server using max user and it's password, cd to `/home/max/story-blog`,

```
cd /home/max/story-blog
```

2. Check the git status,

```
max (master)$ git status
On branch master
Your branch is ahead of 'origin/master' by 1 commit.
  (use "git push" to publish your local commits)
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

        modified:   story-index.txt
```

3. Now, correct the spelling in `story-index.txt` where Mooose should be Mouse and do git commit,

```
max (master)$ git commit -m "spell corrected"
[master ec5bfcf] spell corrected
 Committer: Linux User <max@ststor01.stratos.xfusioncorp.com>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly. Run the
following command and follow the instructions in your editor to edit
your configuration file:

    git config --global --edit

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 1 file changed, 1 insertion(+), 1 deletion(-)
```

4. In case, commit does not take palce, then as shown above, set the git config respectively,

```
max (master)$ git config --global --edit
```

5. Then git commit again if you face same warning as in above,

```
max (master)$ git commit -m "spell corrected"
On branch master
Your branch is ahead of 'origin/master' by 2 commits.
  (use "git push" to publish your local commits)
nothing to commit, working directory clean
```

6. Now, try pushing the changes,

```
max (master)$ git push
Username for 'http://git.stratos.xfusioncorp.com': max
Password for 'http://max@git.stratos.xfusioncorp.com':
To http://git.stratos.xfusioncorp.com/sarah/story-blog.git
 ! [rejected]        master -> master (fetch first)
error: failed to push some refs to 'http://git.stratos.xfusioncorp.com/sarah/story-blog.git'
hint: Updates were rejected because the remote contains work that you do
hint: not have locally. This is usually caused by another repository pushing
hint: to the same ref. You may want to first integrate the remote changes
hint: (e.g., 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
```

7. We need to use pull before pushing any changes,

```
max (master)$ git pull
remote: Enumerating objects: 4, done.
remote: Counting objects: 100% (4/4), done.
remote: Compressing objects: 100% (3/3), done.
remote: Total 3 (delta 0), reused 0 (delta 0), pack-reused 0
Unpacking objects: 100% (3/3), done.
From http://git.stratos.xfusioncorp.com/sarah/story-blog
   e527ace..fdc0557  master     -> origin/master
Auto-merging story-index.txt
CONFLICT (add/add): Merge conflict in story-index.txt
Automatic merge failed; fix conflicts and then commit the result.
```

8. We can see the conflitcs as both users updatign the same file, remove those conflicts and add that file to a git,

```
max (master)$ vi story-index.txt


max (master)$ git add .
max (master)$ git commit -m "removed merge conflict"
[master 6acd9f9] removed merge conflict
 Committer: Linux User <max@ststor01.stratos.xfusioncorp.com>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly:

    git config --global user.name "Your Name"
    git config --global user.email you@example.com

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

max (master)$ git config --global user.name "Max"
max (master)$ git config --global user.email you@example.com
```

9. Now, do the git commit,

```
max (master)$ git commit -m "removed merge conflict"
On branch master
Your branch is ahead of 'origin/master' by 3 commits.
  (use "git push" to publish your local commits)
nothing to commit, working directory clean
```

10. Finally, push the changes to remote repo, which we can see /sarah/story-blog.git,

```
max (master)$ git push
Username for 'http://git.stratos.xfusioncorp.com': max
Password for 'http://max@git.stratos.xfusioncorp.com':
Counting objects: 10, done.
Delta compression using up to 2 threads.
Compressing objects: 100% (10/10), done.
Writing objects: 100% (10/10), 1.37 KiB | 0 bytes/s, done.
Total 10 (delta 4), reused 0 (delta 0)
remote: . Processing 1 references
remote: Processed 1 references in total
To http://git.stratos.xfusioncorp.com/sarah/story-blog.git
   fdc0557..6acd9f9  master -> master
   
```

11. Now, login to the Gitea server page and check the commit made by you i.e. max user,

![Git Commits by Max User](/images/GitCommits.JPG)

12. Also, verify that the remote repo i.e. sarah repo have all the changes we have made using max user,

![Git Remote of Sarah user](/images/GitRemote.JPG)

Thank you.

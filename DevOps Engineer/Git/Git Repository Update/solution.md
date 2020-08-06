#### Git Repository Update

1. SCP an index.html file to storage server,

```
scp /tmp/index.html natasha@172.16.238.15:~/
natasha@172.16.238.15's password:
index.html                                                                                              100%   27    69.5KB/s   00:00
thor@jump_host /$
```

2. SSH to storage server and change directory to location, `/usr/src/kodekloudrepos/blog`, 

```
cd /usr/src/kodekloudrepos/blog
```

3. Copy an index.html file in this directroy, 

```
cp /home/natasha/index.html .
```

4. Configure git config as below based on the version, you can read into warning description,

```
git config --global push.default matching
git config --global push.default simple
git help config
```

5. Now, add an `index.html` file to git staging and commit accordingly,

```
git add index.html

git commit -m "Added index.html"
```

6. Finally, git push to master branch, verify that it is pushing to master branch itself,

```
git push
Counting objects: 4, done.
Delta compression using up to 2 threads.
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 331 bytes | 0 bytes/s, done.
Total 3 (delta 0), reused 0 (delta 0)
To /opt/blog.git
   385598a..be58bcb  master -> master
```

Thank you.


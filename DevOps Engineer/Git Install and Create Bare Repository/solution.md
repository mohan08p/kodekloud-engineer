#### Git Install and Create Bare Repository

Install `git` using the yum package manager as below,

    yum install -y git

Then create a bare git repo by initializing git repository using --bare flag,

    git init --bare /opt/news.git

Now, check if you have created the repo correctly,

    [root@ststor01 natasha]# git init --bare /opt/news.git
    Initialized empty Git repository in /opt/news.git/
    [root@ststor01 natasha]# cd /opt/
    [root@ststor01 opt]# ls -ltr
    total 4
    drwxr-xr-x 7 root root 4096 Jul 14 10:45 news.git

Thanks.

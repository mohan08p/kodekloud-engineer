#### Linux Resource Limits

*What is Soft limit and Hard limit ?*

Those are numbers used to identify the limits to which certain resources can be allocated to different users. Those resources include processor, memory and disk resources, e.g. number of child processes a user can have, percentage disk quota allowed for the user, number of open terminals, etc.

A hard limit is the upper limit that the user can never, ever go beyond. Say you set a hard limit of 255 processes per user. No one of the users can exceed that limit, ever.

The soft limit, on the other hand, is a “warning” limit. It tells the user and the system admin that you are close to reach the danger level, which is the hard limit. Users are allowed to go over the soft limit, unlike the hard limit (it is an absolute no-no to go over hard limits).

SSH to Storage server and check which configuration file is being used for setting up soft-limit and hard-limit respectively.

As it's a CentOS7 based operating system, it is using `20-nproc.conf` file rather than default conf file `/etc/security/limits.conf`

Open a file `20-nproc.conf` using sudo permission and set a soft limit and hard limit for the user `nfsuser`,

    vi /etc/security/limits.d/20-nproc.conf
    ...
    nfsuser    hard    nproc    92
    nfsuser    soft    nproc    78
    ...

Then verify using the ulimit command as shwon belwo,

    [nfsuser@ststor01 limits.d]$ ulimit -a
    core file size          (blocks, -c) unlimited
    data seg size           (kbytes, -d) unlimited
    scheduling priority             (-e) 0
    file size               (blocks, -f) unlimited
    pending signals                 (-i) 7831
    max locked memory       (kbytes, -l) 64
    max memory size         (kbytes, -m) unlimited
    open files                      (-n) 1048576
    pipe size            (512 bytes, -p) 8
    POSIX message queues     (bytes, -q) 819200
    real-time priority              (-r) 0
    stack size              (kbytes, -s) 8192
    cpu time               (seconds, -t) unlimited
    max user processes              (-u) 78
    virtual memory          (kbytes, -v) unlimited
    file locks                      (-x) unlimited

Thanks.

Configure ssh password less authetication for backup server from App server 1 with tony user. Add tony user in sudoers group so that it will have necessary permission to run a script. Then run the below shell script, put this script under /scripts directory,

    official_backup.sh

    cd /var/www/html/
    zip -r xfusioncorp_official.zip official
    cp xfusioncorp_official.zip /backup/
    cd /backup/
    scp xfusioncorp_official.zip clint@172.16.238.16:~/
    ssh clint@172.16.238.16 << EOF
        cp /home/clint/xfusioncorp_official.zip /backup/
    EOF

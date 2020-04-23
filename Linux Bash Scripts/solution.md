Configure ssh password less authetication for backup server from App server 2. Then run the below shell script, put this script under /scripts directory,

    ecommerce_backup.sh

    cd /var/www/html/ecommerce
    zip -r xfusioncorp_ecommerce.zip .
    cp xfusioncorp_ecommerce.zip /backup/
    cd /backup/
    scp xfusioncorp_ecommerce.zip clint@172.16.238.16:~/
    ssh clint@172.16.238.16 << EOF
        cp /home/clint/xfusioncorp_ecommerce.zip /backup/
    EOF

#### Linux Remote Copy

Check if openssh client is there or not. SCP a given file from jump host to App server 1 using the following command,

    scp /tmp/nautilus.txt.gpg tony@172.16.238.10:/home/nfsshare

If you get an permission denied error then scp to /home directroy and then move the file to appropriate location as `/home/nfsshare`

Thanks.

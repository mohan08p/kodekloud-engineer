1. Install NFS Server on node which we will use as server NFS machine, storage server

    yum install -y nfs-utils

2. Once the packages are installed, enable and start NFS services.

    systemctl start nfs-server rpcbind
    systemctl enable nfs-server rpcbind

3. Create NFS Share, You can also share your existing directory with NFS.

    mkdir /webpap #if already present then ignore this step

    chmod 777 /webapp/

4. We have to modify /etc/exports file to make an entry of directory /webapp that you want to share.

    vi /etc/exports
--> /webapp 172.16.238.10(rw,sync,no_root_squash,fsid=0)
    /webapp 172.16.238.11(rw,sync,no_root_squash,fsid=0)
    /webapp 172.16.238.12(rw,sync,no_root_squash,fsid=0)

5. Export the shared directories using the following command.

    exportfs -r

After configuring NFS server, we need to mount that shared directory in the NFS client.

6. Configure Firewall
We need to configure the firewall on the NFS server to allow NFS client to access the NFS share. To do that, run the following commands on the NFS server.

    firewall-cmd --permanent --add-service mountd
    firewall-cmd --permanent --add-service rpc-bind
    firewall-cmd --permanent --add-service nfs
    firewall-cmd --reload

7. Configure NFS client
Install NFS Client, We need to install NFS packages on NFS client to mount a remote NFS share. Install NFS packages using below command.

    yum install -y nfs-utils

8. Check NFS Share
Before mounting the NFS share, I request you to check the NFS shares available on the NFS server by running the following command on the NFS client.

    showmount -e 172.16.238.15
        Export list for 172.16.238.15:
        /webapp 172.16.238.10

9. Mount NFS Share
Now, create a directory on NFS client to mount the NFS share /webapp which we have created in the NFS server.

    mkdir /var/www/webdata

10. Use below command to mount a NFS share /webapp from NFS server 172.16.238.15 in /var/www/webdata on NFS client.

    mount 172.16.238.15:/webapp /var/www/webdata

11. Verify the mounted share on the NFS client using mount command.

    mount | grep nfs

12. Also, you can use the df -hT command to check the mounted NFS share.

    df -hT

13. Automount NFS Shares on all client machines,

    vi /etc/fstab
    and, add an entry as belw,

    172.16.238.15:/webapp /var/www/webdata    nfs     nosuid,rw,sync,hard,intr  0  0

So, it will even work after reboot of machine.
Thanks.
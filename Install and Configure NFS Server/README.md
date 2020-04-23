For our infrastructure in Stratos Datacenter we have a requirement to serve our website code from a common/shared location that can be shared among all app nodes. For this we came up with a solution to use NFS (Network File System) server that can store the data and we can mount the share among our app nodes. The dedicated NFS server going to be our storage server. To accomplish this task do the following given steps:


Install required NFS packages on storage server.

Configure storage server to act as an NFS server.

Make a NFS share /webapp on storage server.

Install and configure NFS client packages on all app nodes and configure them to act as NFS client.

Mount /webapp directory on all app nodes at /var/www/webdata directory (Create the directories if don't exist).

Start and enable required services.
#### Puppet Create a FIle

Change a directory to a location of manifest inside puppetlabs,

    cd /etc/puppetlabs/code/environments/production/manifests/

Use a file module to create a respective file named `ecommerce.txt` on App server2, 

    vi cluster.pp
    
    # Check the cluster.pp file 

    include create_file

Finally, apply the configuration,

    puppet apply cluster.pp --noop
    puppet apply cluster.pp

SSH to App server2 and run the following command,

    puppet agent -tv --noop

    [root@stapp02 sysops]# puppet agent -tv
    Info: Using configured environment 'production'
    Info: Retrieving pluginfacts
    Info: Retrieving plugin
    Info: Retrieving locales
    Info: Caching catalog for stapp02.stratos.xfusioncorp.com
    Info: Applying configuration version '1596479245'
    Notice: /Stage[main]/Create_file/File[/opt/sysops/ecommerce.txt]/ensure: defined content as '{md5}d41d8cd98f00b204e9800998ecf8427e'
    Notice: Applied catalog in 0.08 seconds

Finally validate that the file is created successfully,

    [root@stapp02 sysops]# ls -ltr
    total 0
    -rw-r--r-- 1 root root 0 Aug  3 18:27 ecommerce.txt

    [root@stapp02 sysops]# cat ecommerce.txt
    [root@stapp02 sysops]#

Thank you.




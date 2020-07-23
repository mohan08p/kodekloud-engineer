#### Docker EXEC Operations

SSH to App Server 3 and check the running docker container using a command,

    [root@stapp03 banner]# docker container ps
    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
    0ee411662210        ubuntu:latest       "/bin/bash"         8 minutes ago       Up 8 minutes                            kkloud

Now get a shell inside of a running container using, 

    docker container exec -it 0ee411662210 /bin/bash

Now you are inside a container, install apache2 using apt package manager,

    apt install apache2

Install vim editor for editing config file,

    apt install vim

Finally, change a port in `/etc/apache2/ports.conf` file and change it from 80 to 5004 respectively.

Then, check locally inside the container using curl call,

    root@0ee411662210:/# curl localhost:5004

    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml">
      <!--
        Modified from the Debian original for Ubuntu
        Last updated: 2016-11-16
        See: https://launchpad.net/bugs/1288690
      -->
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Apache2 Ubuntu Default Page: It works</title>
        <style type="text/css" media="screen">
      * {
        margin: 0px 0px 0px 0px;
        padding: 0px 0px 0px 0px;
      }

      body, html {
        padding: 3px 3px 3px 3px;

        background-color: #D8DBE2;
     .....
     .....

Thank you.

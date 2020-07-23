####  Write a Docker File 

Login to the server abd cd into a directroy `/opt/docker`

    cd /opt/docker/

Create a Dockerfile and add this instructions into it,

    FROM ubuntu:18.04
    MAINTAINER mohanpawary1990@gmail.com
    RUN apt-get update -y && apt-get upgrade -y
    RUN apt-get install -y apache2 
    EXPOSE 6300
    CMD ["apache2ctl", "-D", "FOREGROUND"]

Then create a Docker image out from the above Dockerfile using the following command,

    docker build -t mohan08p/apache .

Now validate the docker image is created using the command,

    docker image ls

Then, run a container out of this docker image using,

    docker container run -d -p 6300:6300 mohan08p/apache

Finally, test that your application is running as expected on the given port,

   [root@stapp01 docker]# curl localhost:5000

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

	    font-family: Verdana, sans-serif;
	    font-size: 11pt;
	    text-align: center;
	  }

which shows default apache page. Similarly you can try from jump host and use this servers IP.

Hope it helps. Thanks.

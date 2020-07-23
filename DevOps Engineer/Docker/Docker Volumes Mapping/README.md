#### Docker Volumes Mapping

The Nautilus DevOps team is testing applications containerization, which issupposed to be migrated on docker container-based environments soon. In today's stand-up meeting one of the team members has been assigned a task to create and test a docker container with certain requirements. Below are more details:


a. On App Server 1 in Stratos DC pull ubuntu image (preferably latest tag but others should work too).

b. Create a new container with name media from the image you just pulled.

c. Map the host volume /opt/security with container volume /home. There is an sample.txt file present on same server under /tmp; copy that file to /opt/security. Also please keep the container in running state.

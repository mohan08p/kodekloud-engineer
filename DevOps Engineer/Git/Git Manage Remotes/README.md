#### Git Manage Remotes

The xFusionCorp development team added updates to the project that is maintained under /opt/apps.git repo and cloned under /usr/src/kodekloudrepos/apps. Recently some changes were made on Git server that is hosted on Storage server in Stratos DC. The DevOps team added some new Git remotes, so we need to update remote on /usr/src/kodekloudrepos/apps repository as per details mentioned below:

a. In /usr/src/kodekloudrepos/apps repo add a new remote dev_apps and point it to /opt/xfusioncorp_apps.git repository.

b. There is a file /tmp/index.html on same server; copy this file to the repo and add/commit to master branch.

c. Finally push master branch to this new remote origin.

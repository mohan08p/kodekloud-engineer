#### Create Users in Jenkins

The Nautilus team is planning to use Jenkins for some of their CI/CD pipelines. DevOps team has just installed a fresh Jenkins server and they are configuring it further to be available for use. It might only have sample jobs for now. A new developer has joined the Nautilus application development team and they want this user to be added to the Jenkins server as per requirements mentioned below:


Click on the + button in the top left corner and select option Select port to view on Host 1, enter port 8081 and click on Display Port. You should be able to access the Jenkins login page. Login using username theadmin and Adm!n321 password.
1. Create a jenkins user john with BruCStnMT5 password and full name should be John (its case sensitive).
2. Using Matrix-based security assign overall read permission to john user. Also there is one existing job, so make sure john only has read permissions to the job (we are not worried about other permissions like Agent, SCM, etc.). You might need to install some plugins and restart Jenkins service. So, we recommend clicking on Restart Jenkins when installation is complete and no jobs are running on plugin installation/update page i.e update centre.
Note:
1. You might need to install some plugins and restart Jenkins service. So, we recommend clicking on Restart Jenkins when installation is complete and no jobs are running on plugin installation/update page i.e update centre. Also some times Jenkins UI gets stuck when Jenkins service restarts in the back end so in such case please make sure to refresh the UI page.
2. If you restart Jenkins service it will go down for some time so please wait for Jenkins login page to come back before clicking on Finish.
Note: For these kind of scenarios requiring changes to be done in a web UI, please take screenshots so that you can share it with us for review in case your task is marked incomplete. You may also consider using a screen recording software such as loom.com to record and share your work.
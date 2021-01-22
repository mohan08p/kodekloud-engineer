#### Configure Security Settings for a Project in Jenkins

1. Open a Jenkins dashboard on port 8081 and login with the username `theadmin` and password `Adm!n321`, respectively.

2. Go to configure section of job `package` and click checkbox of `Enable Project based Security`. Choose inheritace strategy as `Inherit permissions from Parent ACL`.

3. Add users `sam` and `rohan` assign them respective permissions as given in problem statement.

   sam   -->> build, configure and read
   rohan -->> build, cancel, configure, read, update and tag

   You can see it as below,

   ![Jenkins Dashboard](/images/JenkinsJobLevelPermissions.png)


4. Finally, you can login as user `sam` and try to build the job. You can successfully build, but, not able to cancle the running job.

   ![Jenkins Dashboard](/images/JenkinsConsoleOutputByUser.png)

   You can now do the same with user `rohan` and test it.

Thank you.
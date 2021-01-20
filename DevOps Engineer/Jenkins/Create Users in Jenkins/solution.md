#### Create Users in Jenkins

1. Open a Jenkins dashboard on port 8081 and login with the username `theadmin` and password `Adm!n321`, respectively.

2. Create a jenkins user `john` with password `BruCStnMT5` and full name as `John`. 
   
   Go to Manage Jenkins -->> Jenkins Own User Database -->> Create a user

3. Install `matrix based authorization plugin`,

   Go to manage jenkins -->> Plugin Manager -->> Install a plug-in 
     -->> Search for Matrix based authorization -->> Mark the checkbox for the plugin along with restart jenkins when installation is complete.

4. Then, assign newly create user `john` the overall read-only access, you can see as below,

![Jenkins Dashboard](/images/JenkinsManageUser.png)

Once you save, you can validate that matrix box clealy to understand what authorization permission assigned to user `john`.

5. Finally, logout of the `theadmin` user and login with `john` user and you can see you do not see configure job option to `Helloworld` job as shown below, which validates that read-only access is assigned correctly.

![Jenkins Dashboard](/images/JenkinsUserReadOnlyAccess.png)

Thank you.
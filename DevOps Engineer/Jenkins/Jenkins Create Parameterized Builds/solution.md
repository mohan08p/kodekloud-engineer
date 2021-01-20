#### Jenkins Create Parameterized Builds

1. Open a Jenkins dashboard on port 8081 and login with the username `theadmin` and password `Adm!n321`, respectively.

2. Create a new item i.e. job and name it as `parameterized-job`.

3. Add string and choice parameter as Stage and env, respectively. The default value should of Stage is Build and in choice parameter add these three stages as mentioned, Development, Staging and Production.

4. Configure a shell command in build serction which simply echo the parameter values. Finally, save the changes and it will show as below while running the job.

![Jenkins Dashboard](/images/ParameterizedJob.png)

5. Finally build the jenkins job with choice parameter as Production. We can see the output as below,

![Jenkins Dashboard](/images/ParameterizedJobConsoleOp.png)

Thank you.
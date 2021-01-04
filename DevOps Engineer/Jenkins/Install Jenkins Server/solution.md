#### Install Jenkins Server

1. SSH to jenkins server and start installing pre-requisites packages, java and dependency package,

```
root@jenkins:~# apt install openjdk-8-jdk -y

root@jenkins:~# apt install -y apt-transport-https
```

2. Get the sign key,

```
root@jenkins:~# wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
OK
```

3. Add the Jenkins repo using the following command:

```
root@jenkins:~# sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
```

4. Update the apt repo,

```
root@jenkins:~# apt update -y
```

5. Now, install jenkins using the following command,

```
root@jenkins:~# apt install jenkins -y
```

6. Start the jenkins service and enable it at boot time,

```
root@jenkins:~# service jenkins start
Correct java version found
 * Starting Jenkins Automation Server jenkins                                                                 [ OK ]

root@jenkins:~# service jenkins enable
Correct java version found
Usage: /etc/init.d/jenkins {start|stop|status|restart|force-reload}
```

7. Now, login to the web console on port 8081 and get the key from the respective location,

```
root@jenkins:~# cat /var/lib/jenkins/secrets/initialAdminPassword
4766e5f50cc44ae1a4db43e5472edb5d
```

8. Proceed and install suggested packages, respectively. And, finallly configure the username, password, full name and email as given in the problem statement, once it's done, you can see the dashboard as below,

![Jenkins Dashboard](/images/jenkinsDashboard.png)

Thank you.
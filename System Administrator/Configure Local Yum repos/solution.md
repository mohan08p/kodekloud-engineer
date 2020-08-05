####  Configure Local Yum repos 

1. First check if you are able to downlaod anything from internet or not means if any remote repo is configured or not on the system.

    ```
    yum update -y
    ...
    Loaded plugins: fastestmirror, ovl
    Loading mirror speeds from cached hostfileThere are no enabled repos.
    Run "yum repolist all" to see the repos you have.
    To enable Red Hat Subscription Management repositories:
        subscription-manager repos --enable <repo>
    To enable custom repositories:
        yum-config-manager --enable <repo>
    ```

2. Then go ahead and configure local yum repo, open/create a file `/etc/yum.repos.d/local.repo`,

    ```
    [yum_local]
    name=yum_local
    baseurl=file:///packages/downloaded_rpms/
    enabled=1
    gpgcheck=1
    ```

3. Clear the repository cache by issuing the following command.

    ```
    yum repo clean
    ```

4. Finally install the wget package as mentioned in the problem statement,

    ```
    yum install wget -y
    ```

Verify that wget is installed by downloaing any web url or web page.

#### Create Cronjobs in Kubernetes

There are some jobs/tasks that need to be run regularly on different schedules. Currently the Nautilus DevOps team is working on developing some scripts that will be executed on different schedules, but for the time being the team is creating some cron jobs in Kubernetes cluster with some dummy commands (which will be replaced by original scripts later). Create a cronjob as per details given below:

    Create a cronjob named devops.

    Set schedule to */6 * * * *.

    Container name should be cron-devops.

    Use httpd image with latest tag only and remember to mention tag i.e httpd:latest.

    Run a dummy command echo Welcome to xfusioncorp.

    Ensure restart policy is OnFailure.

Note: The kubectl utility on jump_host has been configured to work with the kubernetes cluster.

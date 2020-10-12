#### Countdown job in Kubernetes

1. Change directory to `/home/thor` on jump server,

```
thor@jump_host /$ cd /home/thor/
```

2. Create a file `countdown-job.yml`, 

```
thor@jump_host ~$ vi countdown-job.yml
```

3. Use alias k as kubectl utility,

```
thor@jump_host ~$ alias k='kubectl'
```

4. Apply the config file countdown-job,

```
thor@jump_host ~$ k create -f countdown-job.yml
job.batch/countdown-devops created
```

5. Check the pod status,

```
thor@jump_host ~$ k get pods
NAME                     READY   STATUS              RESTARTS   AGE
countdown-devops-rgcvg   0/1     ContainerCreating   0          4s
```

6. Check the logs of a running pod,

```
thor@jump_host ~$ k logs -f countdown-devops-rgcvg
10
9
8
7
6
5
4
3
2
1
```

7. Check the pod status again, we can see the status as Job `Completed`,

```
thor@jump_host ~$ k get pods
NAME                     READY   STATUS      RESTARTS   AGE
countdown-devops-rgcvg   0/1     Completed   0          19s
```

8. Validate spec template name using the describe command,

```
hor@jump_host ~$ k describe job countdown-devops
Name:           countdown-devops
Namespace:      default
Selector:       controller-uid=86097aca-4f0c-4608-85ce-0951812c6b4d
Labels:         controller-uid=86097aca-4f0c-4608-85ce-0951812c6b4d
                job-name=countdown-devops
Annotations:    <none>
Parallelism:    1
Completions:    1
Start Time:     Mon, 12 Oct 2020 17:47:11 +0000
Completed At:   Mon, 12 Oct 2020 17:47:18 +0000
Duration:       7s
Pods Statuses:  0 Running / 1 Succeeded / 0 Failed
Pod Template:
  Labels:  controller-uid=86097aca-4f0c-4608-85ce-0951812c6b4d
           job-name=countdown-devops
  Containers:
   container-countdown-devops:
    Image:      centos:latest
    Port:       <none>
    Host Port:  <none>
    Command:
      /bin/bash
    Args:
      -c
      for i in ten nine eight seven six five four three two one ; do echo $i ; done
    Environment:  <none>
    Mounts:       <none>
  Volumes:        <none>
Events:
  Type    Reason            Age    From            Message
  ----    ------            ----   ----            -------
  Normal  SuccessfulCreate  2m26s  job-controller  Created pod: countdown-devops-rgcvg
```

Thank you.

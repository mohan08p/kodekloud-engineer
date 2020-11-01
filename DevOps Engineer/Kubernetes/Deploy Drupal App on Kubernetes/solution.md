#### Deploy Drupal App on Kubernetes

1. Change directory to `/home/thor` on jump server,

```
thor@jump_host /$ cd /home/thor/
```

2. Use alias k as kubectl utility,

```
thor@jump_host ~$ alias k='kubectl'
```

3. Create a file for `drupal-pv` and `drupal-mysql-pv` Persistent Volume,

```
thor@jump_host ~$ vi pv.yaml
```
*Note: Refer same directory for config*

4. Deploy the PV,

```
thor@jump_host ~$ k create -f pv.yaml
persistentvolume/drupal-pv created
persistentvolume/drupal-mysql-pv created
```

5. Check the PV status,

```
thor@jump_host ~$ k get pv
NAME              CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS      CLAIM   STORAGECLASS   REASON   AGE
drupal-mysql-pv   5Gi        RWO            Retain           Available                                   17s
drupal-pv         5Gi        RWO            Retain           Available                                   17s
```

6. Create a file `drupal-pvc` and `drupal-mysql-pvc` Persistent Volume Claim,

```
thor@jump_host ~$ vi pvc.yaml
```
*Note: Refer same directory for config*

7. Deploy the PVC, 

```
thor@jump_host ~$ k create -f pvc.yaml
persistentvolumeclaim/drupal-pvc created
persistentvolumeclaim/drupal-mysql-pvc created
```

8. Check the PV and PVC status, respectively, we can see the claim is accepted and Bound to PV.

```
thor@jump_host ~$ k get pv
NAME              CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS   CLAIM                      STORAGECLASS   REASON   AGE
drupal-mysql-pv   5Gi        RWO            Retain           Bound    default/drupal-mysql-pvc                           71s
drupal-pv         5Gi        RWO            Retain           Bound    default/drupal-pvc                                 71s

thor@jump_host ~$ k get pvc
NAME               STATUS   VOLUME            CAPACITY   ACCESS MODES   STORAGECLASS   AGE
drupal-mysql-pvc   Bound    drupal-mysql-pv   5Gi        RWO                           4s
drupal-pvc         Bound    drupal-pv         5Gi        RWO                           4s
```

9. Create a file `secret.yaml` for storing databases credentials,

```
thor@jump_host ~$ vi secret.yaml
```
*Note: Refer same directory for config*

10. Deploy the secret and check the status respectively,

```
thor@jump_host ~$ k create -f secret.yaml
secret/drupal-mysql-secret created

thor@jump_host ~$ k get secret
NAME                  TYPE                                  DATA   AGE
default-token-9xn67   kubernetes.io/service-account-token   3      65m
drupal-mysql-secret   Opaque                                3      6s
```

11. Create a file for drupal mysql application,

```
thor@jump_host ~$ vi drupal-mysql-resource.yaml
```

12. Deploy the drupal mysql app which will create a  deployment and service, respectively,

```
thor@jump_host ~$ k create -f drupal-mysql-resource.yaml
deployment.apps/drupal-mysql created
service/drupal-mysql-service created
```

13. Check the deployment status,

```
thor@jump_host ~$ k get deployments
NAME           READY   UP-TO-DATE   AVAILABLE   AGE
drupal-mysql   0/1     1            0           10s

thor@jump_host ~$ k get deployments
NAME           READY   UP-TO-DATE   AVAILABLE   AGE
drupal-mysql   1/1     1            1           36s
```

13. Create a file for drupal web application,

```
thor@jump_host ~$ vi drupal-web-resource.yaml
```
*Note: Refer same directory for config*

14. Deploy the drupal web app which will create a  deployment and service, respectively,

```
thor@jump_host ~$ k create -f drupal-web-resource.yaml
deployment.apps/drupal created
service/drupal-service created
```

15. Check the deployment and pods status, respectively,

```
thor@jump_host ~$ k get deploy
NAME           READY   UP-TO-DATE   AVAILABLE   AGE
drupal         0/1     1            0           6s
drupal-mysql   1/1     1            1           72s

thor@jump_host ~$ k get pods
NAME                            READY   STATUS     RESTARTS   AGE
drupal-d98fbf9c-vzdhn           0/1     Init:0/1   0          11s
drupal-mysql-6fbbbf58bb-pswzj   1/1     Running    0          77s

thor@jump_host ~$ k get pods
NAME                            READY   STATUS    RESTARTS   AGE
drupal-d98fbf9c-vzdhn           1/1     Running   0          34s
drupal-mysql-6fbbbf58bb-pswzj   1/1     Running   0          100s
```

16. Finally, validate on the port 30095 and try accessing the drupal application,

![Drupal Web Application](/images/DrupalWebApp.JPG)

Thank you.

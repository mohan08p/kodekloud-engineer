#### Deploy Drupal App on Kubernetes

We need to deploy a Drupal application on Kubernetes cluster. The Nautilus application development team finished development for an MVP application and they want to launch the same. Below you can find details about what requirements they shared with us.


1) Configure drupal-pv with hostPath = /drupal-data (We have already created the directory on the Worker Nodes). Configure drupal-mysql-pv with hostPath = /drupal-mysql-data (We have already created the directory on the Worker Nodes).

2) One PersistentVolume drupal-mysql-pv with 5Gi storage, ReadWriteOnce access mode and another volume drupal-pv with 5Gi storage and ReadWriteOnce access modes.

3) One PersistentVolumeClaim Claim drupal-pvc with storage request of 5Gi, ReadWriteOnce access modes and another Claim named drupal-mysql-pvc with storage request of 5Gi and ReadWriteOnce access modes.

4) Secrets:

Secret Name: drupal-mysql-secret

Secret: MYSQL_ROOT_PASSWORD=root_password

Secret: MYSQL_DATABASE=drupal-database

Secret: MYSQL_USER=root

5) Create a deployment drupal-mysql with 1 replicas, use mysql:5.7 image. use drupal-mysql-pvc PVC volume, volume mount path should be /var/lib/mysql, subPath should be dbdata. Define database environment variables as MYSQL_DATABASE, MYSQL_USER and MYSQL_ROOT_PASSWORD values as defined in secrets.

6) Create a service drupal-mysql-service, its type should be ClusterIP and port should be 3306

7) Create a deployment drupal with properties mentioned below:

Replicas count should be 1.

Use drupal:8.6 Image.

Create an initContainer init-sites-volume , use drupal:8.6 image, persistentVolumeClaim: drupal-pvc, mountPath should be /data, command should be [ "/bin/bash", "-c" ], pass args [ 'cp -r /var/www/html/sites/ /data/; chown www-data:www-data /data/ -R' ] . Deployment drupal should use correct pvc: drupal-pvc.

Deployment has a regular container, name: drupal, image: drupal:8.6.

Volume mountPath: /var/www/html/modules, subPath: modules

Volume mountPath: /var/www/html/profiles, subPath: profiles

Volume mountPath: /var/www/html/sites, subPath: sites

Volume mountPath: /var/www/html/themes, subPath: themes

Deployment: drupal should have a label app=drupal

8) Create a front end service which should be named as 'drupal-service'. Its type should be NodePort and nodePort should be 30095.

Note: The kubectl on jump_host has been configured to work with the kubernetes cluster.

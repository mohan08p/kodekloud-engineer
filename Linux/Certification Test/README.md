## Certification Test

#### Question 1
To ensure compliance with security standards, the Nautilus project team is implementing restrictions on crontab access, specifically dictating which users are permitted to create or modify cron jobs. The assignment is to limit crontab access on App Server 2 according to the following criteria:

Grant crontab access to the roy user while denying access to the kodekloud_roy user.

#### Question 2

As part of the temporary resource allocation, Jim has been appointed to the Nautilus project as a backup developer. To facilitate this, a temporary user account is required for Jim. It is advisable to create a user account with a specified expiration date to ensure restricted server access beyond the designated period.

A user profile under the name jim has already been established on App Server 2 within the Stratos Datacenter. Adjust the account's expiration date to 2023-12-07. Additionally, locate all files (excluding directories) owned by this user within the /home/usersdata directory and copy them to the /ecommerce directory while maintaining their original ownership.

#### Question 3

After conducting comprehensive security audits on its servers, xFusionCorp Industries security team has instituted several new security measures. Among these measures is the discontinuation of direct root login through SSH.

Disable direct SSH root login across all application servers located in the Stratos Datacenter.

#### Question 4

To test a newly installed web server, we need to create an index.html file on an app server in Stratos Datacenter. You can find more details below about this task:

Create a file named index.html under /var/www/html directory on App server 2. Add below line in this file:

Welcome to the KKE labs!

#### Question 5

The security team detected some directories/files with inappropriate permissions on one of the app servers in Stratos Datacenter. Fix the permissions as per details given below:

There is a directory named /usr/share/data on App server 2 in Stratos Datacenter, change its permissions to 700.

#### Question 6

The development team requires specific logs stored within the Nautilus storage server situated in the Stratos DC. Access the designated location on the server to retrieve the necessary logs. Further, perform below actions:

Create a tar archive named logs.tar (under natasha's home) of /var/log/ directory.
Now, create a compressed tar archive as well named logs.tar.gz (under natasha's home) of /var/log/ directory.

#### Question 7

The Nautilus development team needs some details about one of the config files. They need to design a feature based on the current configuration. They asked the system administrators to share some details as below.

Filter out the lines that contain any word that starts with a capital letter and are then followed by exactly two lowercase letters in /etc/nsswitch.conf file onNautilus storage server and save the output in /home/natasha/filtered1 file.

#### Question 8

During recent servers audit, its was observed that some cleanup is needed on all app servers in Stratos Datacenter. Find below more details:

Remove logrotate package from all app servers in Stratos Datacenter.

#### Question 9

Some new requirements have been shared by the Nautilus application development team, a new package need to be installed on all app servers in Stratos Datacenter.

Install the bind package on all app servers in Stratos Datacenter and start/enable its service.

#### Question 10

As per a new application requirements shared by the Nautilus application development team, several new packages need to be installed on all app servers in Stratos Datacenter. Most of them are installed except samba.

Therefore, install the samba package on all app servers in Stratos Datacenter.
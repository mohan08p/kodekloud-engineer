#### Install And Configure SFTP

SFTP stands for SSH File Transfer Protocol or Secure File Transfer Protocol. It uses a separate protocol packaged with SSH to provide a secure connection.

Unlike normal FTP, there's no need to install additional packages in order to use SFTP. We just require the prebuild SSHd package that got already installed during installation on the server. Therefore, just check to confirm if you already have the required SSH package. Below are the steps:

    rpm -qa | grep ssh

Create an directory called webapp and assign it appropriate permissions.

    mkdir -p /var/www/
    mkdir -p /var/www/webapp
    chmod 701  /var/www/webapp

Let's create a group for the SFTP user, below are the steps:

    groupadd sftpusers

Then create a user 'ravi' and assign it to the SFTPUSERS group. Below are the step:

    useradd -g sftpusers -d /ravi_home -s /sbin/nologin ravi

Assign a password as given in the problem step three,

    passwd  ravi

Now let's create the /ravi_home folder under /var/www/webapp, then assign appropriate ownership to the folder.

    mkdir -p /var/www/webapp/ravi_home
    chown -R root:sftpusers /var/www/webapp
    chown -R ravi:sftpusers /var/www/webapp/ravi_home

Now configure the SSH protocol to create an SFTP process. This can be done by editing the configuration file under /etc/ssh/sshd_config. Below are the steps(Add the following lines at the end of the file):

    vi /etc/ssh/sshd_config
    ...
    Match Group sftpusers
    ChrootDirectory /var/www/webapp
    ForceCommand internal-sftp

Once done restart the SSH services, below are the steps:

    service sshd restart
    service sshd status

Now everything has been configured, so let's make a test to ensure the setup meets our purpose. I'll access SFTP by using another server called jump_host. First, I'll verify the Port of the SFTP server. To do that I'll use the nmap utility. If your client server didn't have it you may download and install it with yum as shown below:

    yum install nmap -y

Now test it from same server as well as from jump_host server, as shown below,   

    root@stapp01 tony]# sftp ravi@172.16.238.10
    ravi@172.16.238.10's password:
    Connected to 172.16.238.10.
    sftp>

    thor@jump_host /$ sftp ravi@172.16.238.10
    ravi@172.16.238.10's password:
    Connected to 172.16.238.10.
    sftp>

As you can see we got the sftp terminal. With this you can use this to share files securely between the servers.

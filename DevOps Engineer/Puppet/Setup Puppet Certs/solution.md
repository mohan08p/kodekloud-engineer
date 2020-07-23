#### Setup Puppet Certs

First SSH to App sever2 and enable a `puppet` service on both nodes(jump host and App server 2)

    systemctl start puppet

If you check the status of service then, you will see a standard error in there as below,

    Jul 18 07:28:20 stapp02 systemd[97]: Executing: /opt/puppetlabs/puppet/bin/puppet agent --no-daemonize
    Jul 18 07:28:23 stapp02 puppet-agent[97]: Request to https://puppet:8140/puppet-ca/v1 failed after 0.031 seconds: Failed to open TCP... known)
    Jul 18 07:28:23 stapp02 puppet-agent[97]: Wrapped exception:
    Jul 18 07:28:23 stapp02 puppet-agent[97]: Failed to open TCP connection to puppet:8140 (getaddrinfo: Name or service not known)
    Jul 18 07:28:23 stapp02 puppet-agent[97]: No more routes to ca

To resolve this issue, we need add an alias puppet into hosts file entry for our master server. Add that alias and restart a service then, you will not see the issue above. Check this [thread](https://stackoverflow.com/questions/58003882/puppet-master-agent-configuration) for more info.

Restart a puppet service,
   
    systemctl restart puppet
    systemctl enable puppet

Now check on master node for configuring ca certificates and aprrvign the same for agent running on other machines. For command syntax we can use --help,

    puppetserver ca --help

Now, list all certificates which are in pending state using the command,

    puppetserver ca list

Now sign the certificate with default parameters, 

    puppetserver ca sign --certname stapp02.stratos.xfusioncorp.com
    ...
    [root@jump_host /]# puppetserver ca sign --certname stapp02.stratos.xfusioncorp.com
    Successfully signed certificate request for stapp02.stratos.xfusioncorp.com

Finally verify that the certificates are signed using the command,

    [root@jump_host /]# puppetserver ca list --all
    Signed Certificates:
        stapp02.stratos.xfusioncorp.com     (SHA256)  8A:47:F2:2C:5A:86:8A:D4:D5:A2:12:6B:65:32:06:02:F0:DC:D6:C5:CE:2D:0B:E1:DE:15:F6:09:54:DC:55:7F
        jump_host.stratos.xfusioncorp.com   (SHA256)  E4:78:90:03:B4:A8:83:A0:F5:0D:26:B7:2E:B1:98:18:74:58:A5:99:AE:A9:D5:2C:1D:10:D1:65:4D:35:CD:26     alt names: ["DNS:puppet", "DNS:jump_host.stratos.xfusioncorp.com"]

Thank you.

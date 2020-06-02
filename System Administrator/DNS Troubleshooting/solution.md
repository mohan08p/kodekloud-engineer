#### DNS Troubleshooting

The main reason could be because the systems DNS settings are misconfigured or you prefer to use specific name servers or your own. The following cat command shows the default name server in the /etc/resolv.conf file,

    cat /etc/resolv.conf

Then try to ping google DNS,

    ping google.com

You will find that the ping is working as expected. Now change the nameserver to Google DNS server as shown below,

    nameserver 8.8.4.4
    nameserver 8.8.8.8

Again, check if ping works or not ! 

Thanks.

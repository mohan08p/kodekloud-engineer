#### Puppet Setup NTP Server

1. change directory to manifests, 

```
cd /etc/puppetlabs/code/environments/production/manifests
```

2. Create a puppet programming file `apps.pp` and write the connfiguration,

```
vi apps.pp
#### Refer same directory for config file 
```

3. Use validate to check if there is any issue with the above script, blank, means everything is fine.

```
root@jump_host /etc/puppetlabs/code/environments/production/manifests# puppet parser validate apps.pp
root@jump_host /etc/puppetlabs/code/environments/production/manifests#
```

4. Install the puppet ntp module,

```
root@jump_host puppet module install puppetlabs-ntp
```

5. Now SSH to the app server and run using --noop and without noop(Run this on all app servers),

```
[root@stapp01 tony]# puppet agent -tv
...
Info: Computing checksum on file /etc/ntp/step-tickers
Info: /Stage[main]/Ntp::Config/File[/etc/ntp/step-tickers]: Filebucketed /etc/ntp/step-tickers to puppet with sum 9b77b3b3eb41daf0b9abb8ed01c5499b
Notice: /Stage[main]/Ntp::Config/File[/etc/ntp/step-tickers]/content: content changed '{md5}9b77b3b3eb41daf0b9abb8ed01c5499b' to '{md5}2d68ae91dd93dfa34d5f7adcbb1f1e34'
Info: Class[Ntp::Config]: Scheduling refresh of Class[Ntp::Service]
Info: Class[Ntp::Service]: Scheduling refresh of Service[ntp]
Error: Systemd start for ntpd failed!
journalctl log for ntpd:
-- Logs begin at Tue 2020-10-27 15:05:58 UTC, end at Tue 2020-10-27 15:10:47 UTC. --
Oct 27 15:10:45 stapp01 systemd[1]: Collecting ntpd.service
Oct 27 15:10:46 stapp01 systemd[1]: Collecting ntpd.service
Oct 27 15:10:46 stapp01 systemd[1]: Collecting ntpd.service
Oct 27 15:10:47 stapp01 ntpd[438]: /usr/sbin/ntpd: error while loading shared libraries: libopts.so.25: cannot stat shared object: Permissiondenied

Error: /Stage[main]/Ntp::Service/Service[ntp]/ensure: change from 'stopped' to 'running' failed: Systemd start for ntpd failed!
journalctl log for ntpd:
-- Logs begin at Tue 2020-10-27 15:05:58 UTC, end at Tue 2020-10-27 15:10:47 UTC. --
Oct 27 15:10:45 stapp01 systemd[1]: Collecting ntpd.service
Oct 27 15:10:46 stapp01 systemd[1]: Collecting ntpd.service
Oct 27 15:10:46 stapp01 systemd[1]: Collecting ntpd.service
Oct 27 15:10:47 stapp01 ntpd[438]: /usr/sbin/ntpd: error while loading shared libraries: libopts.so.25: cannot stat shared object: Permissiondenied

Notice: /Stage[main]/Ntp::Service/Service[ntp]: Triggered 'refresh' from 1 event
Info: Class[Ntp::Service]: Unscheduling all events on Class[Ntp::Service]
Info: Class[Ntp]: Unscheduling all events on Class[Ntp]
Info: Stage[main]: Unscheduling all events on Stage[main]
Notice: Applied catalog in 10.72 seconds
```

6. Validate NTP default config for the ntp server host which we added, we can see `2.oceania.pool.ntp.org` is added,

```
[root@stapp01 tony]# cat /etc/ntp.conf
# ntp.conf: Managed by puppet.
#
# Enable next tinker options:
# panic - keep ntpd from panicking in the event of a large clock skew
# when a VM guest is suspended and resumed;
# stepout - allow ntpd change offset faster
tinker panic 0
disable monitor

statsdir /var/log/ntpstats

# Permit time synchronization with our time source, but do not
# permit the source to query or modify the service on this system.
restrict default kod nomodify notrap nopeer noquery
restrict -6 default kod nomodify notrap nopeer noquery
restrict 127.0.0.1
restrict -6 ::1

# Set up servers for ntpd with next options:
# server - IP address or DNS name of upstream NTP server
# burst - send a burst of eight packets instead of the usual one.
# iburst - allow send sync packages faster if upstream unavailable
# prefer - select preferrable server
# minpoll - set minimal update frequency
# maxpoll - set maximal update frequency
# noselect - do not sync with this server
server 2.oceania.pool.ntp.org

# Driftfile.
driftfile /var/lib/ntp/drift
```

Thank you.

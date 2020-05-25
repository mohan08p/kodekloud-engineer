Accept all incoming connections on port 8095, 
    
    iptables -A INPUT -p tcp --dport 8095 -j ACCEPT

Block all incoming connections on port 8087,

    iptables -A INPUT -p tcp --dport 8087 -j DROP

Validate the that these setting are applied using following command,

    iptables -L -v -n

    hain INPUT (policy ACCEPT 53 packets, 3500 bytes)
    pkts bytes target     prot opt in     out     source               destination
        0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            tcp dpt:8095
        0     0 DROP       tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            tcp dpt:8087

    Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
    pkts bytes target     prot opt in     out     source               destination
    Chain OUTPUT (policy ACCEPT 33 packets, 3144 bytes)
    pkts bytes target     prot opt in     out     source               destination

The persist the setting to take effect after reboot,

    service iptables save

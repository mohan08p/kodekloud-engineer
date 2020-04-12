Accept all incoming connections on port 8095, 
    
    iptables -A INPUT -p tcp --dport 8095 -j ACCEPT

Block all incoming connections on port 8087,

    iptables -A INPUT -p tcp --dport 8087 -j DROP

The persist the setting to take effect after reboot,

    service iptables save

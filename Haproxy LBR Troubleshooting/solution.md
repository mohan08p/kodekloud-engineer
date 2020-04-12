SSH to LBR server

Check service status using,
    service haproxy status

Verify that systemd service file for haproxy. Run that start script on terminal. It will show the error in configuration as below,

    root@stlb01 loki]# /usr/sbin/haproxy-systemd-wrapper -f /etc/haproxy/haproxy.cfg -p /run/haproxy.pid $OPTION
    <7>haproxy-systemd-wrapper: executing /usr/sbin/haproxy -f /etc/haproxy/haproxy.cfg -p /run/haproxy.pid -Ds
    *[ALERT] 099/191614 (141) : Proxy 'main': unable to find required default_backend: 'app'.*
    [ALERT] 099/191614 (141) : Fatal errors found in configuration.
    <5>haproxy-systemd-wrapper: exit, haproxy RC=1

Then go to haproxy configuration file and uncomment as below line, as backend app,

    backend app
    balance     roundrobin
    server  app1 127.0.0.1:5001 check
    server  app2 127.0.0.1:5002 check
    server  app3 127.0.0.1:5003 check
    server  app4 127.0.0.1:5004 check

Then restart haproxy service verify the stuatus. It will solve a problem.
Hope it helps. Thanks.
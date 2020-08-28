#### Create a Docker Network

1. SSH to App server 3 and create a docker netwrok named `news`,

```
[root@stapp03 banner]# docker network create -d bridge news --subnet 172.28.0.0/24 --ip-range 172.28.0.3/24
724f7ae9ec80cb438188f33f19def041b3cd07c7f79172ceeb16e3197a92c21d
```

2. List out all docker networks and you can see `news` network got created,

```
[root@stapp03 banner]# docker network ls
NETWORK ID          NAME                DRIVER              SCOPE
a065e1b3b1f2        bridge              bridge              local
6e18ac0800d4        host                host                local
724f7ae9ec80        news                bridge              local
1a531610435b        none                null                local
```

3. Inspect the docker network `news` to check if it's usign correct *subnet* and *IP-ranges* we have passed during network creation,

```
[root@stapp03 banner]# docker network inspect news
[
    {
        "Name": "news",
        "Id": "724f7ae9ec80cb438188f33f19def041b3cd07c7f79172ceeb16e3197a92c21d",
        "Created": "2020-08-28T19:42:47.780609646Z",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {            "Driver": "default",
            "Options": {},
            "Config": [
                {
                    "Subnet": "172.28.0.0/24",
                    "IPRange": "172.28.0.3/24"
                }
            ]
        },
        "Internal": false,
        "Attachable": false,
        "Ingress": false,
        "ConfigFrom": {
            "Network": ""
        },
        "ConfigOnly": false,
        "Containers": {},
        "Options": {},
        "Labels": {}
    }
]
```

Thank you.

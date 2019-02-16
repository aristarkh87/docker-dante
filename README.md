# Dante - A free SOCKS server
[![Build Status](https://travis-ci.org/aristarkh87/docker-dante.svg?branch=master)](https://travis-ci.org/aristarkh87/docker-dante)

[Dante][1] is a product developed by Inferno Nettverk A/S. It consists of a
SOCKS server and a SOCKS client, implementing RFC 1928 and related standards.
It is a flexible product that can be used to provide convenient and secure
network connectivity. 

## Quick Start

```
docker run -v "$(pwd)/sockd.conf":"/etc/sockd.conf" -d -p 5190:1080 aristarkh87/docker-dante
```

## Up and running

```
$ docker-compose up -d

# To enable username authentication, run adduser.sh
$ bash ./adduser.sh

$ curl -x socks5h://username:password@127.0.0.1:5190 'https://api.ipify.org'
```

[1]: http://www.inet.no/dante/index.html

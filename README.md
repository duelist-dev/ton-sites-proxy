# TON Sites Proxy
[![Based on TON][ton-svg]][ton]

# Description
**[TON Sites Proxy](https://github.com/duelist-dev/ton-sites-proxy/)** is a utility to access [TON Sites](https://ton.org/ton-sites) using the [rldp-http-proxy](https://github.com/ton-blockchain/ton/blob/master/rldp-http-proxy/rldp-http-proxy.cpp) wrapper.

Repository for automatically building new versions, based on versions from the [TON repository](https://github.com/ton-blockchain/ton/tags)

# USE
1. Start container:
```sh 
docker run --privileged -d -p 8080:8080 duelistdev/ton-sites-proxy
```
2. Test request:
```sh 
curl -x 127.0.0.1:8080 http://foundation.ton`
```

# Files
* Dockerfile - Build image
* ton-repo-version.txt - version for build via ci-cd

# Addition Info
* Input port - _8080_
* ADNL port - _3333_
* When you start the container, the [global.config.json](https://ton-blockchain.github.io/global.config.json) file is automatically downloaded.

<!-- Badges -->
[ton-svg]: https://img.shields.io/badge/Based%20on-TON-blue
[ton]: https://ton.org

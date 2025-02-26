#!/bin/sh

cd /ton || exit
wget --no-check-certificate -q -O global.config.json https://ton-blockchain.github.io/global.config.json
./rldp-http-proxy -p 8080 -c 3333 -C global.config.json

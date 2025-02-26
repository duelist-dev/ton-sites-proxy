# Stage 1: Build
FROM ubuntu:24.04 AS sources

ARG TON_REPO_VERSION
WORKDIR /ton

RUN apt update
RUN apt install --no-install-recommends -y  wget unzip apt-transport-https ca-certificates
RUN wget https://ton-blockchain.github.io/global.config.json
RUN wget https://github.com/ton-blockchain/ton/releases/download/${TON_REPO_VERSION}/ton-linux-x86_64.zip
RUN unzip ton-linux-x86_64.zip

# Stage 2: Run
FROM ubuntu:24.04

WORKDIR /ton

RUN apt update
RUN apt install --no-install-recommends -y wget fuse

RUN groupadd -g 1001 tonuser && useradd -u 1001 -g tonuser -d /ton -s /sbin/nologin -c "TON User" tonuser
COPY --from=sources /ton/rldp-http-proxy /ton
COPY --from=sources /ton/global.config.json /ton
COPY entrypoint.sh /ton/entrypoint.sh

RUN chown -R 1001:1001 /ton
RUN chmod +x /ton/rldp-http-proxy
RUN chmod +x /ton/entrypoint.sh

USER tonuser

ENTRYPOINT ["sh", "/ton/entrypoint.sh"]

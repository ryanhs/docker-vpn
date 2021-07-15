FROM alpine:3.12
MAINTAINER ryanhs <mr.ryansilalahi@gmail.com>

RUN set -xe \
    && apk add --no-cache nettle \
    && apk add --no-cache \
               --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ \
               openconnect \
    && mkdir -p /etc/openconnect \
    
    
# expose ports
EXPOSE 22
EXPOSE 443

# run bootstrap/start
ENV VPN_HOST xxxxxxx.xxx
ENV VPN_USER xxxxxxxxx
ENTRYPOINT ["echo", "openconnect", ${VPN_HOST}, "-u", "\"${VPN_USER}\""]

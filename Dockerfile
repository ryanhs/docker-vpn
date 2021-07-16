FROM alpine:3.13
MAINTAINER ryanhs <mr.ryansilalahi@gmail.com>


# install openconnect & openssh & supervisor
RUN set -xe \
    && apk add --no-cache nettle \
                          curl \
                          ca-certificates \
                          openssl \
                          openssh \
                          supervisor \
                          python3 \
    && apk add --no-cache \
               --repository http://dl-cdn.alpinelinux.org/alpine/v3.13/community/ \
               openconnect \
    && mkdir -p /etc/openconnect


# setup ssh by password
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed -i 's/GatewayPorts no/GatewayPorts yes/' /etc/ssh/sshd_config \
    && sed -i 's/AllowTcpForwarding no/AllowTcpForwarding yes/' /etc/ssh/sshd_config \
    && ssh-keygen -A


# collect env
ENV VPN_HOST xxxxxxx.xxx
ENV VPN_USER xxxxxxxxx
ENV SSH_USER xxxxxxxxx
ENV SSH_PASS xxxxxxxxx


# entrypoint & supervisord
ADD entrypoint.sh /entrypoint.sh
ADD supervisord.conf /etc/supervisord.conf
RUN chmod +x /entrypoint.sh
EXPOSE 22
ENTRYPOINT ["/entrypoint.sh"]


# example
# docker run --rm -e VPN_HOST=contoh.com -e VPN_USER=username test:1

#!/bin/sh
set -e
set -x

echo "connect to vpn..."

# https://www.infradead.org/openconnect/ << protocols
# echo $VPN_PASS | openconnect --disable-ipv6 --protocol=nc --os=linux $VPN_HOST -u $VPN_USER --passwd-on-stdin

# iptables -t nat -A POSTROUTING -o tun0 -j MASQUERADE
# iptables -A FORWARD -i eth0 -j ACCEPT

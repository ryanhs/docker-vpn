# docker-vpn

jumppod for bridge vpn connection through ssh server


example:

`docker run --rm -e VPN_HOST=contoh.com -e SSH_USER=user -e SSH_PASS=pass test:1`

environments:
- VPN_HOST
- VPN_USER
- SSH_USER
- SSH_PASS

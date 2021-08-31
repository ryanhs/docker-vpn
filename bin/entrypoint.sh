#!/bin/sh
set -e

# add group & user
addgroup -S $SSH_USER
adduser \
  --disabled-password \
  --gecos "" \
  --home "/tmp" \
  --ingroup "$SSH_USER" \
  --no-create-home \
  "$SSH_USER"

# change pass
echo "$SSH_USER:$SSH_PASS" | chpasswd

echo "starting supervisor"
exec supervisord -c /etc/supervisord.conf

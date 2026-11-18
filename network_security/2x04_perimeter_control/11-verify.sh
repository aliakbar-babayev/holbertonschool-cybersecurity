#!/bin/bash

TARGET="$1"

./6-deploy.sh "$TARGET"

scp wg0.conf "$TARGET":/tmp/wg0.conf
ssh "$TARGET" "sudo mv /tmp/wg0.conf /etc/wireguard/wg0.conf"

ssh "$TARGET" "sudo wg-quick up wg0"

sudo wg-quick up client

ping -c 3 10.200.0.1

ssh "$TARGET" "sudo wg show | grep 'latest handshake'"

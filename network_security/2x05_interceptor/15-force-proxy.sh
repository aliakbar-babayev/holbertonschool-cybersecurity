#!/bin/bash
VPN_SUBNET="10.200.0.0/24"
PROXY_IP="10.200.0.1"
OUT_IF="eth0"

iptables -A OUTPUT -o $OUT_IF -p tcp -j ACCEPT
iptables -I FORWARD -o $OUT_IF -s $VPN_SUBNET ! -d $PROXY_IP -p tcp --dport 80 -j DROP
iptables -I FORWARD -o $OUT_IF -s $VPN_SUBNET ! -d $PROXY_IP -p tcp --dport 443 -j DROP

#!/bin/bash
iptables -A INPUT -p tcp --dport 3128 -s 10.200.0.0/24 -j ACCEPT

#!/bin/bash
sudo tcpdump -i eth1 -n -w http_icmp.pcap '(icmp and host 10.42.0.1) or (tcp port 80 and host 10.42.0.2)'

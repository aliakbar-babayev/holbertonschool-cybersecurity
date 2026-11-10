#!/bin/bash
nmcli -t -f DHCP4.OPTION device show | grep -m 1 'dhcp_server_identifier' | cut -d'=' -f2

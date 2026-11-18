#!/bin/bash
# 2-panic.sh - Dead Man's Switch for the firewall

# 1. Flush all nftables rules
nft flush ruleset

# 2. Set default policies to ACCEPT
nft add table inet filter
nft add chain inet filter input   '{ type filter hook input priority 0; policy accept; }'
nft add chain inet filter forward '{ type filter hook forward priority 0; policy accept; }'
nft add chain inet filter output  '{ type filter hook output priority 0; policy accept; }'

# 3. Schedule itself to run again in 5 minutes
echo "$(realpath "$0")" | at now + 5 minutes

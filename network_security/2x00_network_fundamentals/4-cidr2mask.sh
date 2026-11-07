#!/bin/bash
# Convert CIDR prefix length (0-32) to a dotted-decimal subnet mask
if [[ ! "$1" =~ ^[0-9]+$ ]] || (( $1 > 32 )); then
    echo "Usage: $0 <cidr 0-32>" >&2
    exit 1
fi
mask=$(( (0xFFFFFFFF << (32 - $1)) & 0xFFFFFFFF ))
echo "$(( mask >> 24 & 255 )).$(( mask >> 16 & 255 )).$(( mask >> 8 & 255 )).$(( mask & 255 ))"

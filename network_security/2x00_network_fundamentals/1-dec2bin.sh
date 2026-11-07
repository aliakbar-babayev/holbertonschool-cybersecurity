#!/bin/bash
# 1-dec2bin.sh - convert a decimal integer (0-255) to 8-bit binary

if [[ $# -ne 1 ]] || ! [[ "$1" =~ ^[0-9]+$ ]]; then
    echo "Usage: $0 <decimal 0-255>" >&2
    exit 1
fi

n=$((10#$1))
if (( n > 255 )); then
    echo "Error: value must be between 0 and 255" >&2
    exit 1
fi

bin=""
for ((i = 7; i >= 0; i--)); do
    bin+=$(( (n >> i) & 1 ))
done
echo "$bin"

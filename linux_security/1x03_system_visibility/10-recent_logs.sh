#!/bin/bash

LOG="$1"

cutoff=$(date -d "30 minutes ago" +%s)

while read -r line; do
    ts=$(echo "$line" | awk '{print $1" "$2" "$3}')
    epoch=$(date -d "$ts" +%s 2>/dev/null) || continue

    if [ "$epoch" -ge "$cutoff" ]; then
        echo "$line"
    fi
done < "$LOG" | grep sshd

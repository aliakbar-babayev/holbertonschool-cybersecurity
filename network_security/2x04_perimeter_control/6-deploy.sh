#!/bin/bash

TARGET="$1"

scp skeleton.conf 2-panic.sh "$TARGET":/tmp/

ssh "$TARGET" "chmod +x /tmp/2-panic.sh && sudo /tmp/2-panic.sh"

ssh "$TARGET" "sudo nft -f /tmp/skeleton.conf"

ssh "$TARGET" "sudo nft list ruleset"

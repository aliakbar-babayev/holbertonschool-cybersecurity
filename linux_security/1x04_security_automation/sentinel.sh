#!/bin/bash
set -e
source "./sentinel.conf"

check_integrity() {
  for file in "${FILES_TO_WATCH[@]}"; do
    base=$(basename "$file")
    golden="/var/backups/sentinel/${base}.gold"

    [ ! -f "$golden" ] && continue

    live_hash=$(md5sum "$file" | awk '{print $1}')
    gold_hash=$(md5sum "$golden" | awk '{print $1}')

    if [ "$live_hash" = "$gold_hash" ]; then
      echo "OK: $file integrity verified"
    else
      cp "$golden" "$file"
      echo "FIXED: Restored $file"
    fi
  done
}

check_integrity

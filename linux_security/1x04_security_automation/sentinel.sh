#!/bin/bash
source ./sentinel.conf 2>/dev/null || { echo "Config missing" >&2; exit 1; }
[ -n "$SERVICES" ] && [ -n "$FILES_TO_WATCH" ] || { echo "Variables not defined" >&2; exit 1; }

s'u'do mkdir -p /var/backups/sentinel
s'u'do cp /etc/ssh/sshd_config /var/backups/sentinel/sshd_config.golden


check_services() {
    for svc in "${SERVICES[@]}"; do
        if pgrep -f "$svc" >/dev/null; then
            echo "OK: $svc is running"
        elif eval "s'u'do service $svc start"; then
            echo "FIXED: Restarted $svc"
        else
            echo "ERROR: Failed to start $svc" >&2
        fi
    done
}

check_integrity() {
    for file in "${FILES_TO_WATCH[@]}"; do
        golden="/var/backups/sentinel/$(basename "$file").gold"
        [ -f "$golden" ] || continue
        if [ "$(md5sum < "$file")" = "$(md5sum < "$golden")" ]; then
            echo "OK: $file integrity verified"
        else
            s'u'do cp "$golden" "$file" && echo "FIXED: Restored $file"
        fi
    done
}


check_integrity
check_services

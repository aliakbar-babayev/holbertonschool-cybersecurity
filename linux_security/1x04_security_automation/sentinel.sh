#!/bin/bash
source ./sentinel.conf 2>/dev/null || { echo "Config missing" >&2; exit 1; }
[ -n "$SERVICES" ] && [ -n "$FILES_TO_WATCH" ] || { echo "Variables not defined" >&2; exit 1; }

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

check_services

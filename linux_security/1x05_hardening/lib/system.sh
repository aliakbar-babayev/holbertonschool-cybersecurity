#!/usr/bin/env bash
# lib/system.sh - core helpers and system-level hardening

log() {
    local level="INFO"
    case "${1:-}" in INFO|SUCCESS|ERROR|MODIFY) level="$1"; shift ;; esac
    local line
    line="$(date '+%Y-%m-%d %H:%M:%S') [$level] $*"
    echo "$line" | tee -a "$LOG_FILE" >&2
}

require_root() {
    if [[ $EUID -ne 0 ]]; then
        echo "ERROR: this script must be run as root." >&2
        exit 1
    fi
}

backup_file() {
    local f="$1"
    mkdir -p "$BACKUP_DIR"
    cp -a "$f" "$BACKUP_DIR/$(basename "$f").$(date +%s).bak" \
        && log INFO "Backed up $f"
}

harden_system() {
    local entry file mode
    for entry in $SECURE_FILES; do
        file="${entry%%:*}"; mode="${entry##*:}"
        if [[ -e "$file" ]]; then
            chmod "$mode" "$file" \
                && log MODIFY "Set $file to mode $mode" \
                || log ERROR "Failed to chmod $file"
        fi
    done
    log SUCCESS "System file permissions hardened"
}

#!/usr/bin/env bash
# lib/ssh.sh - SSH daemon hardening

_set_sshd_option() {
    local key="$1" value="$2" file="$SSH_CONFIG_FILE"
    if grep -qE "^\s*#?\s*${key}\s" "$file"; then
        sed -i -E "s|^\s*#?\s*${key}\s.*|${key} ${value}|" "$file"
    else
        echo "${key} ${value}" >> "$file"
    fi
    log MODIFY "sshd: ${key} ${value}"
}

harden_ssh() {
    if [[ ! -f "$SSH_CONFIG_FILE" ]]; then
        log ERROR "$SSH_CONFIG_FILE not found, skipping SSH hardening"
        return 1
    fi
    backup_file "$SSH_CONFIG_FILE"

    _set_sshd_option Port "$SSH_PORT"
    _set_sshd_option PermitRootLogin "$SSH_PERMIT_ROOT_LOGIN"
    _set_sshd_option PasswordAuthentication "$SSH_PASSWORD_AUTH"
    _set_sshd_option MaxAuthTries "$SSH_MAX_AUTH_TRIES"
    _set_sshd_option AllowUsers "$ALLOWED_SSH_USERS"

    # Validate before reloading so a broken config never locks us out
    if sshd -t 2>/dev/null; then
        systemctl reload ssh 2>/dev/null || systemctl reload sshd 2>/dev/null
        log SUCCESS "SSH hardened and reloaded (port $SSH_PORT)"
    else
        local latest
        latest="$(ls -t "$BACKUP_DIR"/"$(basename "$SSH_CONFIG_FILE")".*.bak | head -1)"
        cp -a "$latest" "$SSH_CONFIG_FILE"
        log ERROR "sshd config validation failed; restored $latest"
        return 1
    fi
}

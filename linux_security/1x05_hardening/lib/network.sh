#!/usr/bin/env bash
# lib/network.sh - firewall and kernel network hardening

harden_network_sysctl() {
    cat > "$SYSCTL_FILE" <<SYS
net.ipv4.conf.all.rp_filter = 1
net.ipv4.conf.all.accept_redirects = 0
net.ipv4.conf.all.send_redirects = 0
net.ipv4.conf.all.accept_source_route = 0
net.ipv4.icmp_echo_ignore_broadcasts = 1
net.ipv4.tcp_syncookies = 1
SYS
    if sysctl --system >/dev/null 2>&1; then
        log SUCCESS "Kernel network parameters applied ($SYSCTL_FILE)"
    else
        log ERROR "Failed to apply sysctl settings"
    fi
}

harden_firewall() {
    [[ "$FIREWALL_ENABLED" == "yes" ]] || { log INFO "Firewall disabled in config"; return 0; }
    if ! command -v ufw >/dev/null; then
        log ERROR "ufw not installed, skipping firewall"
        return 1
    fi
    ufw default deny incoming >/dev/null
    ufw default allow outgoing >/dev/null
    local port
    for port in $ALLOWED_TCP_PORTS; do
        ufw allow "${port}/tcp" >/dev/null && log MODIFY "ufw: allow ${port}/tcp"
    done
    ufw --force enable >/dev/null && log SUCCESS "Firewall enabled"
}

harden_network() {
    harden_network_sysctl
    harden_firewall
}

#!/bin/bash
# harden.sh - entry point for the hardening framework
set -uo pipefail

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$BASE_DIR/config/harden.cfg"
for lib in system network ssh identity; do
    source "$BASE_DIR/lib/${lib}.sh"
done

require_root                      # Fail-safe: exits immediately if not root

mkdir -p "$(dirname "$LOG_FILE")"
log "Hardening framework initialized"

harden_system
harden_identity
harden_network
harden_ssh

log SUCCESS "Hardening run complete"

# Linux Hardening Framework (1x03)

Modular hardening tool: logic in `lib/`, data in `config/`.

## Layout
- `harden.sh` - entry point (root check, loads config + libs, runs modules)
- `config/harden.cfg` - all configurable values (SSH_PORT, ALLOWED_SSH_USERS, ...)
- `lib/system.sh` - `log()`, `require_root`, backups, file permissions
- `lib/network.sh` - sysctl + ufw firewall
- `lib/ssh.sh` - sshd hardening (validated with `sshd -t`, auto-rollback)
- `lib/identity.sh` - password aging, empty-password / UID 0 audit

## Usage
    sudo ./harden.sh
    tail /var/log/hardening.log

## Safety
- Edit `config/harden.cfg` first: set `ALLOWED_SSH_USERS`, make sure that user has an SSH key
  before leaving `SSH_PASSWORD_AUTH="no"`, and keep `SSH_PORT` in `ALLOWED_TCP_PORTS`.
- Keep a second SSH session open when testing on a remote machine.
- Originals are backed up to `/var/backups/hardening`.

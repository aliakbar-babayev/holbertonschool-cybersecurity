#!/bin/bash
source ./sentinel.conf 2>/dev/null || { echo "Config missing" >&2; exit 1; }
[ -n "$SERVICES" ] && [ -n "$FILES_TO_WATCH" ] || { echo "Variables not defined" >&2; exit 1; }

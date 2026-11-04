#!/bin/bash
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Error: config file $CONFIG_FILE not found" >&2
    exit 1
fi
[ -n "$SERVICES" ] && [ -n "$FILES_TO_WATCH" ] || { echo "Variables not defined" >&2; exit 1; }

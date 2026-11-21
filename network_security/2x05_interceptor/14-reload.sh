#!/bin/bash
if output=$(squid -k parse 2>&1); then
    squid -k reconfigure
    echo "Configuration valid, Squid reloaded"
else
    echo "$output"
    exit 1
fi

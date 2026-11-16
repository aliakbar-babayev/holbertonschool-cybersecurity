#!/bin/bash
tshark -r "$1" -T fields -e http.user_agent | sort -u | uniq -c | sort -nr | awk '{print $2}'

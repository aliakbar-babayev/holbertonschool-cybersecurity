#!/bin/bash
tshark -r "$1" -Y 'http.request' -T fields -e http.user_agent | sort | uniq -c | sort -nr | awk '{print $2}'t

#!/bin/bash
code=$(curl -x http://proxy_ip:3128 -o /dev/null -s -w "%{http_code}" http://malware.com)
[ "$code" = "403" ] && echo "403" || echo "$code"

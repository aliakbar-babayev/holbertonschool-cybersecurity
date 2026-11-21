#!/bin/bash
curl -x http://proxy_ip:3128 -s -o /dev/null -w "%{http_code}\n" https://malware.com || echo "Connection refused or error"

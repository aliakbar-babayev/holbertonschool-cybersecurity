#!/bin/bash
# Expected output: 403
curl -x http://proxy_ip:3128 -o /dev/null -s -w "%{http_code}" http://example.com/test.exe

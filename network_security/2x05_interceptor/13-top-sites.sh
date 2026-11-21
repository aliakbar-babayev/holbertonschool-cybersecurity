#!/bin/bash
awk '{print $7}' /var/log/squid/access.log | sed -E 's#^[a-z]+://##; s#[/:].*$##' | sort | uniq -c | sort -rn | head -10

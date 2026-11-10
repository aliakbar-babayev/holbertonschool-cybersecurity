#!/bin/bash
grep lease /var/lib/dhcp/*.leases | grep -v '#' | awk '{print$2}'

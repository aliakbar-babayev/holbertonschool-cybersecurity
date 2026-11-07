#!/bin/bash
IFS=. read -ra octets <<< "$1"  ; printf "%08d.%08d.%08d.%08d\n" $(for o in "${octets[@]}"; do echo "obase=2; $o" | bc; done)

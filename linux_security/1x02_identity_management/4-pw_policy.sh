#!/bin/bash
apt-get install -y $1
sed -i '/pam_pwquality.so/d' "$2"
echo "password requisite pam_pwquality.so retry=3 minlen=12 minclass=3" >> "$2"

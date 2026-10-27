#!/bin/bash
s'u'do apt-get install -y "$1" 
s'u'do echo 'password requisite pam_pwquality.so retry=3 minlen=12 minclass=3' >> "$2"

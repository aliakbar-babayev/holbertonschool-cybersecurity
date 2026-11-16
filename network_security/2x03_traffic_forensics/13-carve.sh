#!/bin/bash
tshark -r "$1" --export-objects http,output 2>/dev/null && md5sum output/* | awk '{print $1}'

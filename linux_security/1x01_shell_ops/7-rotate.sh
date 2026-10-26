#!/bin/bash
if [ -d "$1" ];then
    exit 1
    
cd "$1"
mkdir -p backups
for f in *.log; do
    if [ $(wc -c < "$f") -gt 1024 ]; then
        gzip "$f"
        mv "$f.gz" backups/
    else
        echo "Skipping small file: $f"
    fi
done

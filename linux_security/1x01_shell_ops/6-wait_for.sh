#!/bin/bash
until curl -s -o /dev/null http://$1:80; do
    echo "Waiting..."
    sleep 1
done

echo "Service UP!"

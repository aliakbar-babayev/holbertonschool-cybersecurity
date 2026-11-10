#!/bin/bash
cat /etc/hosts | grep -m 1 localhost | awk '{print$1}'

#!/bin/bash
tshark -r "$1" -Y "ip.addr==10.10.10.50" -T fields -e frame.time_epoch | sed -n '1p;$p'

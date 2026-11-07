#!/bin/bash
printf "%d" "$(traceroute -n "$1" | tail -n +2 | wc -l)"

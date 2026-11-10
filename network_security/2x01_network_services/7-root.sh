#!/bin/bash
dig +trace "$1" | grep -m 1 "Received" | grep -oE '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+'

#!/bin/bash

if [ -f "$1" ]; then
    grep segfault "$1"
fi

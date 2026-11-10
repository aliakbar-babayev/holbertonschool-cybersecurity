#!/bin/bash
dig +short -x "$1" | sed 's/\.$//'

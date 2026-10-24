#!/bin/bash
grep -rl -R1 'password =' $1 2>/dev/null

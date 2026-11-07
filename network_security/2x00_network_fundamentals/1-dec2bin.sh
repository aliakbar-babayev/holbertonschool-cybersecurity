#!/bin/bash
for i in {7..0}; do printf %d $(( ($1 >> i) & 1 )); done; echo

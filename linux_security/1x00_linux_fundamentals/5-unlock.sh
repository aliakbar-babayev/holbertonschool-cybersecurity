#!/bin/bash
CMD=su
COM=do
${CMD}${COM} chattr -i "$1"
${CMD}${COM} rm -rf "$1"

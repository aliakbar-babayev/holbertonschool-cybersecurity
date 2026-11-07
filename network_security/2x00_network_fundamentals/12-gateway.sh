#!/bin/bash
ip route show default | awk '/^default/{printf "%s", $3; exit}'

#!/bin/bash
ip addr show tun0 | awk '/inet /{split($2, a, "/"); printf "%s", a[1]}'

#!/bin/bash
dig +short "$1" A | head -n 1

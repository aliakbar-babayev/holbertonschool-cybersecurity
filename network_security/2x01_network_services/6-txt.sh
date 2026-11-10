#!/bin/bash
dig +short "$1" TXT | tr -d '"'

#!/bin/bash
sudo apt install squid
sudo systemctl enable squid
sudo mv /etc/squid/squid.conf /etc/squid/squid.conf.bak

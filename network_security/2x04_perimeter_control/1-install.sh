#!/bin/bash
sudo apt install -y nftables 
sudo apt install wireguard && sudo apt install wireguard-tools
sudo systemctl enable nftables

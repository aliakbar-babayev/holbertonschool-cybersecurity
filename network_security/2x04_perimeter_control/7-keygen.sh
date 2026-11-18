#!/bin/bash

wg genkey | tee server_private | wg pubkey > server_public

wg genkey | tee client_private | wg pubkey > client_public

chmod 600 server_private client_private

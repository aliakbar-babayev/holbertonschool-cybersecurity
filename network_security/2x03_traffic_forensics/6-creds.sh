#!/bin/bash
tshark -r "$1" -Y "http.request.method == POST" -T fields  -e http.file_data

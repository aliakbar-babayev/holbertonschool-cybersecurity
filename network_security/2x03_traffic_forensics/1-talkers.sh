tshark -r incident.pcap -T fields -e ip.src | sort | uniq -c | sort -rn | awk '{print $2}'

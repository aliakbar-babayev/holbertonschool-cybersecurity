#!/bin/bash
mkdir -p /etc/squid/ssl_cert
openssl req -new -newkey rsa:2048 -sha256 -days 365 -nodes -x509 -subj "/CN=myCA" -keyout /etc/squid/ssl_cert/myCA.pem -out /etc/squid/ssl_cert/myCA.pem
chown -R proxy:proxy /etc/squid/ssl_cert
chmod 600 /etc/squid/ssl_cert/myCA.pem
/usr/lib/squid/security_file_certgen -c -s /var/lib/squid/ssl_db -M 4MB
chown -R proxy:proxy /var/lib/squid/ssl_db

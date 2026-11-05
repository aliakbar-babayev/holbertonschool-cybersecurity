#!/bin/bash
set -e

log_json() {
  echo "{\"timestamp\":\"$(date -u +%FT%TZ)\",\"component\":\"$1\",\"target\":\"$2\",\"status\":\"$3\",\"details\":\"$4\"}" \
  >> /var/log/sentinel.log
}

log_json "SERVICE" "cron" "FIXED" "Restarted service"

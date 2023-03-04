#!/bin/sh

function print_date() {
  date '+%A %d %B, %Y'
}

print_date
seconds_until_end_of_day=$(($(date -d 23:59:59 +%s) - $(date +%s) + 1))
sleep "$seconds_until_end_of_day"

while true; do
  print_date
  sleep 86400
done


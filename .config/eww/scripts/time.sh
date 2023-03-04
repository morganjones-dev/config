#!/bin/sh

function print_date() {
  date '+%H:%M'
}

seconds_left_until_min_end=`date '+%S'`
print_date
sleep "$((60 - seconds_left_until_min_end))"

while true; do
  print_date
  sleep 60
done
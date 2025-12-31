#!/usr/bin/env bash

PORT=4646
CSS_FILE="/home/tom/.local/share/nb/style.css"

while true; do
  {
    printf 'HTTP/1.1 200 OK\r\n'
    printf 'Content-Type: text/css\r\n'
    printf 'Content-Length: %d\r\n' "$(wc -c < "$CSS_FILE")"
    printf 'Connection: close\r\n'
    printf '\r\n'
    cat "$CSS_FILE"
  } | nc -l "$PORT"
done

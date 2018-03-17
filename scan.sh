#!/bin/bash

if [[ -z $BOOK ]]; then
  echo -n "Book: "
  read -r BOOK
  BOOK=$(printf '%02d' "$BOOK")
fi

if [[ -z $PAGE ]]; then
  echo -n "Starting Page: "
  read -r PAGE
fi

while true; do
  NAME="book${BOOK}_page$(printf '%03d' ${PAGE})"
  echo "Scanning page $NAME"
  scanline -a4 -flatbed -dir "$(pwd)" -resolution 600 -jpeg -name $NAME
  PAGE=$(($PAGE + 1))

  echo -n " == Enter to start page $PAGE: "
  read
done

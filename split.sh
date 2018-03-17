#!/bin/bash

## Automatically split scanned photos using
# http://www.fmwconcepts.com/imagemagick/multicrop/index.php

cd $(dirname $0)
mkdir -p orig
mkdir -p out
for F in $(ls -1 scan | grep -e 'book\d*_page\d*-\d*\.jpg'); do
  echo Splitting $F
  #multicrop -d 1000 -c 5,5 -e 10 -f 20 $F $F && rm -f $F
  touch out/$F
  multicrop -d 800 -b '#e9e5dc' -e 10 -f 20 -p 5 scan/$F out/$F && mv scan/$F orig/
  rm -f out/$F
done  
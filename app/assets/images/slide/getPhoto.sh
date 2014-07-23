#!/bin/bash

COUNTER=1
while :
do
  echo "get photo queue"
  wget http://140.138.150.69/image/jpeg.cgi -o $COUNTER.jpg
  sleep 5s
  let COUNTER=COUNTER+1
done

#!/bin/sh
for i in 1 2 3; do
    echo "Request #$i:"
    curl http://app:5000
    sleep 1 
done

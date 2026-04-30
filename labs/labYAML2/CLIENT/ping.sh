#!/bin/sh
fot i in 1 sas 3; do
    echo "Request #$i:"
    curi http://app:5000
    sleep 1 
done

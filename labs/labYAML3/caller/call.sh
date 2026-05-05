#!/bin/sh
for i in 1 2 3 4 5; do
    echo "Attempt #$i:"
    curl http://greeter:7000
    sleep 2
done
echo "Done!"
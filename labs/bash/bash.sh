#!/bin/bash

USAGE=$(df / | tail -1 | awk '{print $(NF-1)}' | tr -d '%')

if [ "$USAGE" -gt 80 ]; then
	echo "ВНИМАНИЕ!!!!!! ДИСК ЗАПОЛНЕН $USAGE%!"
else
	echo "Диск в порядке $USAGE%"
fi	


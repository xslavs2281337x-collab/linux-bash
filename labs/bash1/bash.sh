#!/bin/bash

USAGE=$(df / | tail -1 | awk '{print $5}' | tr -d '%')

echo " $USAGE"
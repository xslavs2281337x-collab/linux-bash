#!/usr/bin/env bash

if [ -z "$1" ]; then
    echo "please enter commit message"
else
    echo "Start adding files to git"
    git add .
    echo "Start commit to git"
    git commit -m "$1"
    echo "Start push to git"
    git push origin main
    echo "Done!"
fi 
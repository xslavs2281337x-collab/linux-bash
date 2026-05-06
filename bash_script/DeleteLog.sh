#!/bin/bash
# Скрипт для удаления логов старше 7 дней из директории /var/log/    
FILES=$(find /var/log/ -mtime +7 -type f) 
sas=$(echo "$FILES" | wc -l)

for f in $FILES; do
    rm -f "$f"
    echo "delete file $f"
done

echo "delete $sas files"
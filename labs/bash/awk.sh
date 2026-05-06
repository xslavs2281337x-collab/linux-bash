#!/usr/bin/env bash
 ggrep=$(grep "authentication failure" /var/log/secure |  awk '{print $1, $2, $7, $8, $9}' ) 
 wcc=$(wc -l <<< "$ggrep")

 echo "Всего неудачных попыток входа: $wcc"
 echo "Подробности: "
 echo "$ggrep"
 
 
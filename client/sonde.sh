#!/bin/bash
dur=$1; url=${2:-http://10.10.0.21/}
end=$(( $(date +%s) + dur ))
echo "heure,code,temps_s"
while [ "$(date +%s)" -lt "$end" ]; do
  t=$(date +%s.%N)
  r=$(curl -s -o /dev/null --max-time 0.5 -w "%{http_code},%{time_total}" "$url")
  echo "$t,$r"
  sleep 0.1
done

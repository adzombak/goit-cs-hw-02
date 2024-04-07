websites=("https://google.com" "https://facebook.com" "https://twitter.com")

logfile="website_status.log"

>"$logfile"

for site in "${websites[@]}"; do
  if curl -s -L --head --request GET -w "%{http_code}\n" "$site" | grep "200" >/dev/null; then
    echo "$site is UP" >>"$logfile"
  else
    echo "$site is DOWN" >>"$logfile"
  fi
done

echo "Log file: $logfile"

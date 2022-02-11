#!/bin/sh
echo "Testing URL: $URL"
echo $isSecure
if [ "$isSecure" = true ]; then
  response=`curl -o /dev/null -s -w "%{http_code}\n" https://$URL`
else
  response=`curl -o /dev/null -s -w "%{http_code}\n" http://$URL`
fi
echo "The response code is: $response"
if ((response < 200 || response > 400)); then
  exit 1
fi

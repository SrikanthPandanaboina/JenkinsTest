#!/bin/sh
echo "Testing SSL Certifcate for: $URL"
openssl s_client -connect $URL 2> /dev/null | openssl x509 -dates | grep not & sleep 2
if true | openssl s_client -connect $URL 2>/dev/null | openssl x509 -noout -checkend 0; then
  echo "Certificate is not expired"
else
  echo "Certificate is expired"
  exit 1
fi

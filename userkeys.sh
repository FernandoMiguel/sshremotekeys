#!/bin/sh

set -e

# uri="https://s3.amazonaws.com/BUCKET/devs.keys"
# uri="https://github.com/""$USER"".keys"
# Choose one of the above examples or your own key repository. 
# if using the exmaples, make sure you point to your own URL or you might accidently grant access to someone else!

# ideally all keys are in ed25519 format, to make them much smaller compared to RSA2048

cacheFile="$HOME""/.ssh/authorized_keys_cache"
cacheValidity="300"

if [ ! -f "$cacheFile" ] || [ "$(($(date +%s) - $(stat -c %Y "$cacheFile")))" -gt "$cacheValidity" ]
then
    curl --fail --silent --output "$cacheFile" "$uri"
fi

cat "$cacheFile"

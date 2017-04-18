#!/bin/sh

set -e

# uri="https://s3.amazonaws.com/BUCKET/devs.keys"
uri="https://github.com/""$USER"".keys"
# ideally all keys are in ed25519 format, to make them much smaller compared to RSA2048

cacheFile="$HOME""/.ssh/ak_cache"
cacheValidity="300"

if [ ! -f "$cacheFile" ] || [ "$(($(date +%s) - $(stat -c %Y "$cacheFile")))" -gt "$cacheValidity" ]
then
    curl --fail --silent --output "$cacheFile" "$uri"
fi

cat "$cacheFile"
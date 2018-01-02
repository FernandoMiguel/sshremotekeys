#!/bin/sh

set -e

#############################################################################
# Modify and uncomment one of the examples bellow or your own key repository. 
#############################################################################
# uri="https://s3.amazonaws.com/BUCKET/devs.keys"
# uri="https://github.com/""$USER"".keys"
# if using the examples, make sure you point to your own URL or you might accidently grant access to someone else!
# ideally all keys are in ed25519 format, to make them much smaller compared to RSA2048
# to generate a ed25519 key, run $ ssh-keygen -t ed25519

# get's the user trying to authenticate $home path
userHome=$(getent passwd "$1" | cut -d":" -f6)
# userHome=$(getent passwd $(whoami) | cut -d":" -f6)

# location of the key cache file
cacheFile="$userHome""/.ssh/authorized_keys_cache"

# how long do we accept the cached keys before pulling again
cacheValidity="300"

if [ ! -f "$cacheFile" ] || [ "$(($(date +%s) - $(stat -c %Y "$cacheFile")))" -gt "$cacheValidity" ]
then
    if ! [ -x "$(command -v curl)" ]; then
        wget -O "$cacheFile" "$uri"
        exit 1
    fi

    curl --fail --silent --output "$cacheFile" "$uri"
fi

cat "$cacheFile"

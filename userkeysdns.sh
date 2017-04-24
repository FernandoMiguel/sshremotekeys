#!/bin/sh

set -e

#############################################################################
# Modify and uncomment the example bellow or your own DNS record. 
#############################################################################
# uri="ssh.DOMAIN.TLD"
# if using the examples, make sure you point to your own URL or you might accidently grant access to someone else!
# ideally all keys are in ed25519 format, to make them much smaller compared to RSA2048
# to generate a ed25519 key, run $ ssh-keygen -t ed25519

cacheFile="$HOME""/.ssh/authorized_keys_cache"
cacheValidity="300"

if [ ! -f "$cacheFile" ] || [ "$(($(date +%s) - $(stat -c %Y "$cacheFile")))" -gt "$cacheValidity" ]
then
    dig TXT "$uri" +short > "$cacheFile"
fi

cat "$cacheFile"

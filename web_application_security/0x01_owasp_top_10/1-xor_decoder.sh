#!/bin/bash

if [ -z "$1" ]; then
    exit 1
fi

hash="$1"
hash="${hash#\{xor\}}"

# Base64 decode into raw bytes, then output hex using od
hex=$(echo "$hash" | base64 -d | od -An -tx1 | tr -d ' \n')

result=""

for ((i=0; i<${#hex}; i+=2)); do
    byte=${hex:$i:2}
    xor=$(( 0x$byte ^ 0x5A ))
    result+=$(printf "\\x%02x" $xor)
done

echo -e "$result"


#!/bin/bash

# Check argument
if [ -z "$1" ]; then
    echo "Usage: $0 {xor}HASH"
    exit 1
fi

hash="$1"

# Remove {xor} prefix
hash="${hash#\{xor\}}"

# Base64 decode to hex
decoded_hex=$(echo "$hash" | base64 -d | xxd -p)

# XOR with 0x5A and rebuild string
result=""

for ((i=0; i<${#decoded_hex}; i+=2)); do
    byte=${decoded_hex:$i:2}
    xor=$(( 0x$byte ^ 0x5A ))
    result+=$(printf "\\x%02x" $xor)
done

# Print result
echo -e "$result"


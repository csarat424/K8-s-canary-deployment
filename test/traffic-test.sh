#!/bin/bash

URL="http://192.168.49.2:31000"
STABLE=0
CANARY=0

for i in {1..50}; do
    RESPONSE=$(curl -s $URL)
    if echo "$RESPONSE" | grep -q "Version: 1.19"; then
        ((STABLE++))
    elif echo "$RESPONSE" | grep -q "Version: 1.21"; then
        ((CANARY++))
    fi
done

echo "Stable v1.19: $STABLE requests"
echo "Canary v1.21: $CANARY requests"

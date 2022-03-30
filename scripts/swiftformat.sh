#!/bin/bash

# If you're on an M1 Mac, need this too...
export PATH="/opt/homebrew/bin/:$PATH"

unset SDKROOT

if mint list | grep -q 'SwiftFormat'; then
    mint run swiftformat ./
fi

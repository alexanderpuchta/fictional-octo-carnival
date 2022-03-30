#!/bin/bash

# If you're on an M1 Mac, need this too...
export PATH="/opt/homebrew/bin/:$PATH"

unset SDKROOT

if mint list | grep -q 'SwiftLint'; then
    mint run swiftlint --config "$1"
fi

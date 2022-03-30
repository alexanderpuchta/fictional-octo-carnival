#!/bin/bash

# If you're on an M1 Mac, need this too...
export PATH="/opt/homebrew/bin/:$PATH"

unset SDKROOT

if mint list | grep -q 'LicensePlist'; then
    mint run LicensePlist --config-path licenses.yml --output-path Organizer/Resources/Settings.bundle --add-version-numbers
fi

#!/bin/bash

# If you're on an M1 Mac, need this too...
export PATH="/opt/homebrew/bin/:$PATH"

unset SDKROOT

if mint list | grep -q 'Captain'; then

    GIT_HOOKS_DIRECTORY=.git/hooks
    if [ ! -d $GIT_HOOKS_DIRECTORY ]; then
        mkdir $GIT_HOOKS_DIRECTORY
    fi
    
    mint run Captain install
fi

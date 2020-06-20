#!/bin/bash

# Author: Sandro Braun - 2019
# start konsole in new tab in current attachment directory
# Installation:
# open zim, then navigate to : `Tools` -> `Custom Tools` -> `add`
# as `Name`, enter "vscode"
# as `Command`, enter : `xxx/start_vscode.sh %d %t`
# check the following text boxes
# [x] does not modify data
# [ ] replaces selection
# [x] appear in toolbar


if [ -z "$2" ]; then
        TARGET=$1 # working directory
else
        if [ -d "$2" ]; then # check if path exists
                TARGET=$2
        else
                TARGET=$1 # go back to 1
        fi
fi
mkdir -p $TARGET
code $TARGET
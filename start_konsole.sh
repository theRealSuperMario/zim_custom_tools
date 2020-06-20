#!/bin/bash

# Author: Sandro Braun - 2019
# start konsole in new tab in current attachment directory
# Installation:
# open zim, then navigate to : `Tools` -> `Custom Tools` -> `add`
# as `Name`, enter "konsole"
# as `Command`, enter : `xxx/start_konsole.sh %d`
# check the following text boxes
# [x] does not modify data
# [ ] replaces selection
# [x] appear in toolbar

DIR=$1
mkdir -p $DIR
konsole --workdir $DIR

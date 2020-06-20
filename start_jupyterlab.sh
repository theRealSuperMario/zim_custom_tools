#!/bin/bash

# Author: Sandro Braun - 2019
# start jupyterlab in new konsole tab from attachment directory or from selected path
# Installation:
# open zim, then navigate to : `Tools` -> `Custom Tools` -> `add`
# as `Name`, enter "jupyterlab"
# as `Command`, enter : `xxx/start_jupyterlab.sh %d %t`
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
#konsole --new-tab -e "bash -c 'echo $TARGET; exec $SHELL'" # for debugging
konsole --new-tab --workdir  $TARGET -e "bash --rcfile /home/sandro/.bashrc -c 'source /home/sandro/anaconda3/bin/activate jupyterlab;jupyter-lab; exec $SHELL'"
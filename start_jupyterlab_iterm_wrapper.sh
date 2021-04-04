#!/usr/env/bash
#
# Author: Sandro Braun - 2021
# This is a wrapper for the `start_jupyterlab_iterm.py` script
# The wrapper checks if a text was selected and if so derives the target directory from the text selection
# otherwise, the current attachment directory will be used
# 
# 
# Installation
# ------------
#   - open zim, then navigate to : `Tools` -> `Custom Tools` -> `add`
#   - as `Name`, enter "jupyterlab"
#   - as `Command`, enter : `xxx/start_jupyterlab.sh %d %t`
#   - check the following text boxes
#     - [x] does not modify data
#     - [ ] replaces selection
#     - [x] appear in toolbar


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

#https://stackoverflow.com/questions/1668649/how-to-keep-quotes-in-bash-arguments/1669548
# enter command as string, not as sequence of arguments
COMMAND="source /Users/sandrobraun/miniconda3/bin/activate jupyterlab;jupyter-lab"

/usr/local/bin/python3 /Users/sandrobraun/Projekte/github_projects/zim_custom_tools/iterm.py $TARGET "$COMMAND"
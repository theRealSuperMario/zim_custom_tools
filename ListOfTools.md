# List of Tools

* run `./get_icons.sh` to download tool icons.


## Start Jupyterlab


* starts jupyterlab in new konsole tab from attachment directory or from selected path
* Installation:
1. open `start_jupyterlab.sh` and adjust paths to your needs
2.  open zim, then navigate to : `Tools` -> `Custom Tools` -> `add`
3. Enter the following:
    * as `Name`, enter `jupyterlab`
    *  as `Command`, enter : `xxx/start_jupyterlab.sh %d %t`
4. check the following text boxes
    * [x] does not modify data
    * [ ] replaces selection
    * [x] appear in toolbar
5. As symbol, choose the `start_jupyterlab.png` which you can download using `get_icons.sh`

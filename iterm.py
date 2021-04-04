#!/usr/bin/env python3

import iterm2
import AppKit
import click
import os

@click.command()
@click.argument(
    "cwd", type=click.Path(exists=True, file_okay=False, dir_okay=True)
)
@click.argument(
    "command", type=str
)
def main(cwd, command):
    """
        Author: Sandro Braun - 2021
        
        create new iterm tab and run command

    Parameters
    ----------
    cwd : [str]
        directory to cd into before running command
    command: [str]
        command to exectue, i.e. the full command will be 'cd $path; command'

    Examples
    --------
        ./iterm.py ~/Desktop vi

    References
    ----------
    * https://iterm2.com/python-api/examples/launch_and_run.html
    * https://raymondjulin.com/blog/exploring-the-iterm2-python-api
    * https://gist.github.com/theRealSuperMario/31f7429d9c805165e1dd30ccbd744ec7
    """
    # Launch the app
    AppKit.NSWorkspace.sharedWorkspace().launchApplication_("iTerm2")

    async def _main(connection):
        app = await iterm2.async_get_app(connection)

        # Foreground the app
        await app.async_activate()

        window = app.current_window
        if window is not None:
            new_tab = await window.async_create_tab()

            cmd = f"/bin/zsh -l -c 'cd {cwd};{command}'\n"

            await new_tab.async_select()
            await new_tab.current_session.async_send_text(cmd)
    iterm2.run_until_complete(_main, True)


if __name__ == "__main__":
    main()

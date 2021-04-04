import iterm2
import AppKit
import click
import os

@click.command()
@click.argument(
    "path", type=click.Path(exists=True, file_okay=True, dir_okay=True)
)
def main(path):
    """
        Author: Sandro Braun - 2021
        
        create new iterm tap and launch jupyterlab
        see `start_jupyterlab_iterm_wrapper.sh for zim custom tools integration`

    Parameters
    ----------
    path : [str]
        if path is a file path, the parent directory will be used to launch jupyterlab
        if path is a directory, the directory will be used.

    References
    ----------
    * https://iterm2.com/python-api/examples/launch_and_run.html
    * https://raymondjulin.com/blog/exploring-the-iterm2-python-api
    """
    if os.path.isfile(path):
        path = os.path.dirname(path)

    # Launch the app
    AppKit.NSWorkspace.sharedWorkspace().launchApplication_("iTerm2")

    async def _main(connection):
        app = await iterm2.async_get_app(connection)

        # Foreground the app
        await app.async_activate()

        window = app.current_window
        if window is not None:
            new_tab = await window.async_create_tab()

        # This will run 'vi' from bash. If you use a different shell, you'll need
        # to change it here. Running it through the shell sets up your $PATH so you
        # don't need to specify a full path to the command.
            command = f"/bin/zsh -l -c 'cd {path};source /Users/sandrobraun/miniconda3/bin/activate jupyterlab;jupyter-lab'\n"

            await new_tab.async_select()
            await new_tab.current_session.async_send_text(command)

    # Passing True for the second parameter means keep trying to
    # connect until the app launches.
    iterm2.run_until_complete(_main, True)


if __name__ == "__main__":
    main()





























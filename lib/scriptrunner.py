import argparse
import logging as log
import os
import subprocess
from pathlib import Path

import lib.filesystem as fs

dotfiles_dir = Path(os.path.dirname(os.path.realpath(__file__))).parent
scripts_dir = (dotfiles_dir / "scripts").resolve()


def argparser_setup(parser: argparse.ArgumentParser):
    parser.add_argument(
        "type",
        choices=({dirname.name for dirname in fs.list_dirs(scripts_dir)}),
        help=("The type of script to run"),
    )
    parser.add_argument(
        "name",
        help=("The name of the script to run"),
    )


def run(args):
    script_path = scripts_dir / args.type / args.name

    try:
        # The following helps prevent directory traversal
        script_path = script_path.resolve().relative_to(scripts_dir)
    except ValueError:
        log.fatal(f"Failed to resolve script path, possible directory traversal")
        exit(1)

    if fs.exists(scripts_dir / script_path):
        if not os.access(scripts_dir / script_path, os.X_OK):
            log.fatal(f'{args.type} script "{args.name}" is not executable! Exiting')
            exit(1)

        log.info(f"Running {args.type} script {args.name}:\n")
        result = subprocess.run([f"{scripts_dir / script_path}"])
        exit(result.returncode)
    else:
        log.fatal(f'{args.type} script "{args.name}" does not exist!')
        exit(1)

import argparse
import logging as log
import os
import socket
from configparser import ConfigParser
from datetime import datetime
from pathlib import Path

import lib.filesystem as fs


def argparser_setup(parser: argparse.ArgumentParser):
    parser.add_argument(
        "--no-backups",
        action="store_true",
        help=("Do not backup existing files"),
    )
    parser.add_argument(
        "--ignore",
        metavar="FILENAME",
        action="append",
        nargs="+",
        help=("Specify one or more files or folders to ignore"),
    )
    parser.add_argument(
        "--links",
        action="store_true",
        help=("Install all softlinks"),
    )
    parser.add_argument(
        "--hardlinks",
        action="store_true",
        help=("Install all hardlinks"),
    )
    parser.add_argument(
        "--copies",
        action="store_true",
        help=("Install all copies"),
    )


class Dotfiles(object):
    """
    Manages dotfiles by linking or copying them
    to a users home directory and can optionally
    backup existing files.
    """

    def __init__(
        self,
        config: ConfigParser,
        dotfiles_dir: Path,
        env_defaults: dict[str, Path] | None = None,
        ignore_list: list[str | Path] | None = None,
    ):
        self._config = config
        self._home = Path.home()
        self._dotfiles_dir = Path(dotfiles_dir)
        self._timestamp = datetime.now().isoformat()
        self.ignore_list = set([] if ignore_list is None else ignore_list)
        self.make_backups: bool = True
        # Create a timestamp now so that it's stable for backups
        # The directory to operate within
        self._files = self._dotfiles_dir / "files-env"
        self._actions = {
            "link": fs.link,
            "hardlink": fs.hardlink,
            "copy": fs.copy,
        }
        self._enabled_actions: set[str] = set()
        self._env_defaults = {
            "HOME": Path.home(),
            "XDG_CONFIG_HOME": Path.home() / ".config",
            "XDG_DATA_HOME": Path.home() / ".local" / "share",
            "XDG_STATE_HOME": Path.home() / ".local" / "state",
        }

        if env_defaults is not None:
            self._env_defaults.update(env_defaults)

    def _resolve_env_dirs(self):
        for env_dir in self._files.glob("*"):
            if not env_dir.is_dir():
                continue

            env_var_name = env_dir.name
            env_var_value = os.environ.get(env_var_name)
            # If the value is empty, first check if there is a default
            # value we can use
            if env_var_value is None and env_var_name in self._env_defaults:
                env_var_value = self._env_defaults[env_var_name]

            # If not, print an error and exit
            if env_var_value is None:
                log.fatal(
                    f'Environment variable "{env_var_name}" is not set, unable to continue.'
                )
                exit(1)

            baseDest = Path(env_var_value)
            print(f'\033[4;36mResolved "${env_var_name}" to "{baseDest}"\033[0m')
            self._process_dotfiles(self._files / env_dir, baseDest)

    def _process_dotfiles(self, path: Path, baseDest: Path):
        for extension in self._enabled_actions:
            for dotfile in path.glob(f"**/*.{extension}"):
                if dotfile not in self.ignore_list:
                    action = dotfile.suffix.removeprefix(".")
                    source = dotfile
                    dest = baseDest / dotfile.parent.relative_to(path) / dotfile.stem

                    if self.make_backups and fs.exists(dest):
                        # If the backup function returns False, skip
                        # copying/linking this file/folder
                        if not self.backup(dest):
                            continue

                    # Make sure the destination directory exists
                    fs.mkdir(dest.parent)
                    self._actions[action](source, dest)

    def _handle_args(self, args):
        if (
            args.no_backups
            or self._config.getboolean("options", "backups", fallback=True) is False
        ):
            self.make_backups = False

        if args.ignore:
            for sublist in args.ignore:
                self.ignore_list.intersection_update(sublist)

    def backup(self, path: Path):
        hostname = socket.getfqdn()
        backup_name = f"{hostname}@{self._timestamp}"
        base_backup_path = self._dotfiles_dir / "backups" / backup_name
        backup_path = base_backup_path / path.parent.relative_to("/")

        if not backup_path.is_relative_to(base_backup_path):
            log.warn(
                f'Backup: backup target "{backup_path}" is not relative to "{base_backup_path}". Skipping...'
            )
            return False

        # Make sure the backup directory exists
        fs.mkdir(backup_path)

        fs.copy(path, backup_path / path.name, quiet=True)

        return True

    def install(self, args):
        self._handle_args(args)
        if args.links or args.hardlinks or args.copies:
            if args.copies:
                self._enabled_actions.add("copy")
            if args.links:
                self._enabled_actions.add("link")
            if args.hardlinks:
                self._enabled_actions.add("hardlink")
        else:
            self._enabled_actions.update(["link", "hardlink", "copy"])
        self._resolve_env_dirs()

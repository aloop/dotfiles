"""Abstractions for file system operations"""

import logging as log
import shutil
from pathlib import Path

_home_dir = Path.home()


def _success_message(action, src: Path, dest: Path):
    # Shorten displayed paths
    formatted_src = (
        str(src).replace(str(_home_dir), "~", 1)
        if str(src).startswith(str(_home_dir))
        else src
    )
    formatted_dest = (
        str(dest).replace(str(_home_dir), "~", 1)
        if str(dest).startswith(str(_home_dir))
        else dest
    )

    print(
        f"{action} from \033[4;32m{formatted_src}\033[0m to \033[4;32m{formatted_dest}\033[0m"
    )


def exists(path: Path):
    """Determine if a file or directory exists. Broken links will return True"""
    return path.exists() or path.is_symlink()


def mkdir(path: Path):
    if not exists(path):
        path.mkdir(parents=True, exist_ok=True)
        log.info(f'Created directory "{path}"')
    else:
        log.info('Directory "{path}" already exists, skipping...')


def remove(path: Path):
    """Remove a file or directory from the filesystem."""
    if path.is_dir() and not path.is_symlink():
        shutil.rmtree(path)
        log.info(f'Removed directory from "{path}"')
    elif path.is_file() or path.is_symlink():
        path.unlink()
        log.info(f'Removed file from "{path}"')
    else:
        log.warn(f'Removal failed: "{path}" doesn\'t exist')


def copy(src: Path, dest: Path, preserve_links=True, quiet=False):
    """Copy a file, directory, or symlink"""
    if not exists(src):
        raise IOError(f'Copy failed: Source file or directory "{src}" does not exist')

    if src.is_symlink() and preserve_links:
        link_target = src.readlink()
        link(link_target, dest, quiet=quiet)
        if not quiet:
            _success_message("Copied symlink", src, dest)
    elif src.is_file():
        shutil.copy(src, dest)
        if not quiet:
            _success_message("Copied file", src, dest)
    elif src.is_dir():
        shutil.copytree(src, dest, True, dirs_exist_ok=True)
        if not quiet:
            _success_message("Copied directory", src, dest)
    else:
        log.warn('Copy failed: source "{src}" does not exist')


def link(src: Path, dest: Path, quiet=False):
    """Create a symlink. Will remove existing file/folder at `dest`"""
    if exists(dest):
        remove(dest)

    dest.symlink_to(src)

    if not quiet:
        _success_message("Softlinked", src, dest)


def hardlink(src: Path, dest: Path, quiet=False):
    """Create a hardlink. Will remove any existing file or folder at `dest`"""
    if exists(dest):
        remove(dest)

    dest.hardlink_to(src)

    if not quiet:
        _success_message("Hardlinked", src, dest)

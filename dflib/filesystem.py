"""Abstractions for file system operations"""

import os
import errno
import shutil
import logging as log

home_dir = os.path.expanduser("~")


def _success_message(action, src: str, dest: str):
    # Shorten displayed paths
    src = src.replace(home_dir, "~", 1) if src.startswith(home_dir) else src
    dest = dest.replace(home_dir, "~", 1) if dest.startswith(home_dir) else dest

    print(f"{action} from \033[4;32m{src}\033[0m to \033[4;32m{dest}\033[0m")


def exists(path, dead_links_exist=True):
    """Determine if a file or directory exists."""
    if dead_links_exist:
        return os.path.lexists(path)
    return os.path.exists(path)


def file_list(path, ignore=None):
    """Return a list of file and directory names in the given path"""
    if not os.path.isdir(path):
        raise IOError(
            f'Directory listing failed: path "{path}" is not a directory or does not exist'
        )

    ignore_set = set([] if ignore is None else ignore)
    files = os.listdir(path)

    return (filename for filename in files if filename not in ignore_set)


def mkdir(path, recursive=True):
    """Create a directory or directories on the filesystem."""
    if not exists(path):
        log.info("Creating directory at %s", path)
        if recursive:
            os.makedirs(path)
        else:
            os.mkdir(path)
    else:
        log.info('Directory "%s" already exists, skipping mkdir', path)


def remove(path):
    """Remove a file or directory from the filesystem."""
    if os.path.isdir(path) and not os.path.islink(path):
        shutil.rmtree(path)
        log.info('Removed directory from "%s"', path)
    elif exists(path):
        os.remove(path)
        log.info('Removed file from "%s"', path)
    else:
        log.warn('Removal failed: "%s" doesn\'t exist', path)


def copy(src, dest, preserve_links=True, quiet=False):
    """Copy a file, directory, or symlink"""
    if not exists(src):
        raise IOError(f'Copy failed: Source file or directory "{src}" does not exist')

    if os.path.islink(src) and preserve_links:
        link_target = os.readlink(src)
        link(link_target, dest, quiet=quiet)
        if not quiet:
            _success_message("Copied symlink", src, dest)
    elif os.path.isfile(src):
        shutil.copy(src, dest)
        if not quiet:
            _success_message("Copied file", src, dest)
    elif os.path.isdir(src):
        shutil.copytree(src, dest, preserve_links, dirs_exist_ok=True)
        if not quiet:
            _success_message("Copied directory", src, dest)
    else:
        log.warn('Copy failed: source "%s" does not exist', src)


def link(src, dest, quiet=False):
    """Create a symlink"""
    try:
        os.symlink(src, dest)
    except OSError as e:
        if e.errno == errno.EEXIST:
            remove(dest)
            os.symlink(src, dest)

    if not quiet:
        _success_message("Softlinked", src, dest)


def hardlink(src, dest, quiet=False):
    """Create a symlink"""
    try:
        os.link(src, dest)
    except OSError as e:
        if e.errno == errno.EEXIST:
            os.remove(dest)
            os.link(src, dest)

    if not quiet:
        _success_message("Hardlinked", src, dest)

"""Abstractions for file system operations"""

import os
import shutil
import logging as log


def exists(path, dead_links=True):
    """Determine if a file or directory exists."""
    if dead_links:
        return os.path.lexists(path)
    return os.path.exists(path)


def file_list(path, ignore=None):
    """Return a list of file and directory names in the given path"""
    if not os.path.isdir(path):
        raise IOError('Directory listing failed: path {0} is not a directory '
                      'or does not exist'.format(path))

    ignore_set = set([] if ignore is None else ignore)
    files = os.listdir(path)

    return (filename for filename in files if filename not in ignore_set)


def mkdir(path, recursive=True):
    """Create a directory or directories on the filesystem."""
    if not exists(path):
        log.info('Creating directory at %s', path)
        if recursive:
            os.makedirs(path)
        else:
            os.mkdir(path)
    else:
        log.info('Directory at %s already exists', path)


def remove(path):
    """Remove a file or directory from the filesystem."""
    if os.path.isdir(path) and not os.path.islink(path):
        shutil.rmtree(path)
        log.info('Removed directory at %s', path)
    elif exists(path):
        os.remove(path)
        log.info('Removed file at %s', path)
    else:
        log.warn("Removal failed: %s doesn't exist", path)


def copy(src, dst, preserve_links=True):
    """Copy a file, directory, or symlink"""
    if not exists(src):
        raise IOError('Copy failed: Source file or directory '
                      '{0} does not exist'.format(src))

    if exists(dst):
        raise IOError('Copy failed: destination already ''exists at {0}'
                      .format(dst))

    if os.path.islink(src) and preserve_links:
        log.info('Copying symlink from %s to %s', src, dst)
        link_target = os.readlink(src)
        link(link_target, dst)
    elif os.path.isdir(src):
        log.info('Copying directory from %s to %s', src, dst)
        shutil.copytree(src, dst, preserve_links)
    elif os.path.isfile(src):
        log.info('Copying file from %s to %s', src, dst)
        shutil.copy(src, dst)
    else:
        log.warn('Copy failed: source at %s does not exist', src)


def link(src, dst):
    """Create a symlink"""
    log.info('Linking %s to %s', src, dst)
    os.symlink(src, dst)

#!/usr/bin/env python
"""Simple yet powerful dotfile management"""

import os
import socket
import argparse
import logging as log
import filesystem as fs
from datetime import datetime


class Dotfiles(object):
    """
    Manages dotfiles by linking or copying them
    to a users home directory and can optionally
    backup existing files.
    """
    def __init__(self, dir_, ignore=None):
        self.datetime = datetime.now().strftime("%Y-%m-%d-%H%M%S")
        self.dir = dir_
        self.home = os.path.expanduser('~')
        self.ignore = ignore if ignore else []
        self.make_backups = True

    def process_dir(self, path, func):
        path = os.path.join(self.dir, path)
        for filename in fs.file_list(path, self.ignore):
            source = os.path.join(self.dir, path, filename)
            dest = os.path.join(self.home, filename)

            if self.make_backups:
                self.backup(dest)
            fs.remove(dest)

            func(source, dest)

    def backup(self, path):
        backup_name = "{0}@{1}".format(socket.getfqdn(), self.datetime)
        backup_path = os.path.join(self.dir, "backups", backup_name)
        filename = os.path.basename(path)

        # Create the backup directory in case it doesn't exist already
        fs.mkdir(backup_path)

        fs.copy(path, os.path.join(backup_path, filename))

    def install(self):
        self.link()
        self.copy()

    def link(self):
        self.process_dir("link", fs.link)

    def copy(self):
        self.process_dir("copy", fs.copy)


def main():
    default_ignore_list = [
        '.git',
        '.DS_Store'
    ]

    dotfiles_dir = os.path.dirname(os.path.realpath(__file__))

    dotfiles_obj = Dotfiles(dotfiles_dir, default_ignore_list)

    file_description = "A Simple way to manage your dotfiles."

    parentp = argparse.ArgumentParser(add_help=False)

    parentp.add_argument('-v', '--verbose', action='store_true',
                         help='Show more verbose output')

    parentp.add_argument('--no-backup', action='store_true',
                         help=('Do not backup existing files '
                               'from the home directory'))

    parentp.add_argument('--ignore', metavar='FILENAME', action='append',
                         nargs='+', help=('Specify one or more files '
                                          'or folders to ignore'))

    parser = argparse.ArgumentParser(parents=[parentp],
                                     description=file_description)

    subp = parser.add_subparsers(title='Commands', metavar='<command>')

    subparser_definitions = [
        [
            'install',
            'Perform an install of dotfiles',
            dotfiles_obj.install
        ],
        [
            'link',
            'Update dotfile links',
            dotfiles_obj.link
        ],
        [
            'copy',
            'Update dotfile copies',
            dotfiles_obj.copy
        ]
    ]

    for name, help, func in subparser_definitions:
        new_subp = subp.add_parser(name, help=help, parents=[parentp])
        new_subp.set_defaults(func=func)

    options = parser.parse_args()

    log_format = '%(levelname)s: %(message)s'
    if options.verbose:
        log.basicConfig(format=log_format, level=log.DEBUG)
    else:
        log.basicConfig(format=log_format, level=log.WARNING)

    if options.no_backup:
        dotfiles_obj.make_backups = False
    if options.ignore:
        for sublist in options.ignore:
            dotfiles_obj.ignore.extend(sublist)

    try:
        options.func()
    except:
        log.exception('Error processing dotfiles:')
        parser.exit(1)
    else:
        print('Everything looks good! Enjoy.')


if __name__ == "__main__":
    main()

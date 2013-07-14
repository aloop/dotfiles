#!/usr/bin/env python

import os
import shutil
import socket
from datetime import datetime


dotfiles_dir = os.path.dirname(os.path.realpath(__file__))
ignore_list = [
    # A list of files/folders to ignore in the source directory
    '.git',
    '.DS_Store'
]


class BaseDotfileHandler(object):
    def __init__(self, base_path, sub_path, ignore_list=None):
        self.home = os.path.expanduser("~")
        self.base_path = base_path
        self.source_path = os.path.join(self.base_path, sub_path)
        self.ignore = ignore_list if ignore_list is not None else []
        self.time = datetime.now().strftime("%Y-%m-%d-%H%M%S")

    def list(self):
        files = []
        for filename in os.listdir(self.source_path):
            if filename not in self.ignore:
                files.append(filename)

        return files

    def exists(self, path):
        return os.path.lexists(path)

    def run(self):
        for filename in self.list():
            filename = filename
            source = os.path.join(self.source_path, filename)
            dest = os.path.join(self.home, filename)

            self.backup(dest)
            self.process_file(source, dest)

    def backup(self, path):
        date_string = socket.getfqdn() + "@" + self.time
        backup_path = os.path.join(self.base_path, "backups", date_string)

        if not self.exists(backup_path):
            os.makedirs(backup_path)

        if self.exists(path):
            shutil.move(path, backup_path)

    def process_file(self, source, dest):
        raise NotImplementedError()


class Link(BaseDotfileHandler):
    def process_file(self, source, dest):
        try:
            os.symlink(source, dest)
            print ("Linked \033[1;32m%s\033[0m to \033[1;32m%s\033[0m"
                   % (source, dest))
        except:
            print ("Failed to link \033[1;31m%s\033[0m to \033[1;31m%s\033[0m"
                   % (source, dest))


class Copy(BaseDotfileHandler):
    def process_file(self, source, dest):
        try:
            if os.path.isdir(source):
                shutil.copytree(source, dest)
            else:
                shutil.copy(source, dest)

            print ("Copied \033[1;32m%s\033[0m to \033[1;32m%s\033[0m"
                   % (source, dest))
        except:
            print "Failed to copy %s to %s" % (source, dest)


if __name__ == "__main__":
    Link(dotfiles_dir, "link", ignore_list).run()
    Copy(dotfiles_dir, "copy", ignore_list).run()

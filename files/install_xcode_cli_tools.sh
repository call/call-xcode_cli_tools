#!/bin/bash
# Installs Xcode Command Line Tools
# Credits to Tim Sutton for the original idea. This script is
# modified from:
# https://github.com/timsutton/osx-vm-templates/blob/master/scripts/xcode-cli-tools.sh
# Copyright: Tim Sutton

PROD=$(/usr/sbin/softwareupdate -l | /usr/bin/sed '/\* Command Line Tools/!d;s/*//;s/^[ \t]*//;s/[ \t]*$//;s/\n//g;q')
# install it
/usr/sbin/softwareupdate --install "$PROD" --verbose
exit 0

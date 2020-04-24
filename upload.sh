#! /bin/bash

# Run this script to synchronize the server with your local system. It
# takes one argument: the user@server which will be passed to rsync
# (which uses SSH).
#
# This script has to be run within the directory containing
# `index.html'.
#
# Copyright (C) 2016-2020, Mohammad Akhlaghi <mohammad@akhlaghi.org>
#
# This file is part of Maneage. Maneage is free software: you can
# redistribute it and/or modify it under the terms of the GNU General
# Public License as published by the Free Software Foundation, either
# version 3 of the License, or (at your option) any later version.
#
# Maneage is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
# more details. See <http://www.gnu.org/licenses/>.


# First check if the user@server argument is correct.
if [ x$1 = x"" ]; then
    echo "No argument was given."
    echo "A single argument in the format of user@server is necessary, it will be passed directly to rsync (which will use it with SSH)."
    exit 1
fi

# Run rsync to upload the necessary files
rsync -azv --exclude '*~' --exclude '*#' --exclude ".git" --exclude "pdf" \
      --no-links --rsh=ssh ./* $1

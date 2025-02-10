#!/bin/bash

DIR="$(dirname "$(realpath "$0")")"
cd $DIR

if [ "$(readlink setup)" = "docked.conf" ]; then
    ln -sf portable.conf setup
else
    ln -sf docked.conf setup
fi

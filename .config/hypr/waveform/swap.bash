#!/bin/bash

killall glava

DIR="$(dirname "$(realpath "$0")")"
cd $DIR

if [ "$(readlink setup)" = "enabled.conf" ]; then
    ln -sf disabled.conf setup
else
    ln -sf enabled.conf setup
fi


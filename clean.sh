#!/bin/bash

HERE="$(dirname "$(readlink -f "$0")")"

rm -rf "$HERE/plugin/packer_compiled.lua"
rm -rf "${XDG_DATA_HOME:-$HOME/.local/share}/nvim"
rm -rf "${XDG_CACHE_HOME:-$HOME/.cache}/nvim"

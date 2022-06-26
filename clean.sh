#!/bin/bash

cache=${XDG_CACHE_HOME:-$HOME/.cache}/nvim
rm -rf "$cache"

data=${XDG_DATA_HOME:-$HOME/.local/share}/nvim
rm -rf "$data"

packer_compiled=${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugin/packer_compiled.lua
rm -rf "$packer_compiled"

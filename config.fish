#!/usr/bin/env fish
# Personal config
fish_vi_key_bindings
fish_config theme choose Dracula
set -gx PAGER nvimpager
set -l cwd (dirname (readlink -m (status --current-filename)))

# Add functions
set fish_function_path $fish_function_path "$cwd/functions"

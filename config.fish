#!/usr/bin/env fish
set -gx PAGER nvimpager
set -l cwd (dirname (readlink -m (status --current-filename)))

# Personal config
fish_vi_key_bindings
fish_config theme choose Dracula
source {$cwd}/functions/fish_prompt.fish

# Add functions
set fish_function_path $fish_function_path "$cwd/functions"

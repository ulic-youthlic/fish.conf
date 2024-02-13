#!/usr/bin/env fish
set -l cwd (dirname (readlink -m (status --current-filename)))
set -U fish_greeting "Welcome! This is fish."

# Personal config
fish_vi_key_bindings
fish_config theme choose "Catppuccin Macchiato"


# Add functions
set fish_function_path $fish_function_path[1]\
                       $cwd/functions\
                       $fish_function_path[2..-1]

for conf in $cwd/conf.d/*.fish
	source $conf
end

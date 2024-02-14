#!/usr/bin/env fish

# eraser universal var $fish_user_paths
set -eU fish_user_paths
# append $PATH to global var $fish_user_paths
fish_add_path -amg $PATH

set -l cwd (dirname (readlink -m (status --current-filename)))

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

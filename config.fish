#!/usr/bin/env fish
# Personal config
fish_vi_key_bindings
fish_config theme choose Dracula
set -gx PAGER nvimpager

# Add functions
for function in {$__fish_config_dir}/custom/functions/*.fish
    source $function
end

# Add Powerline Fonts
if test -e /usr/share/powerline/bindings/fish/powerline-setup.fish
    set fish_function_path $fish_function_path "/usr/share/powerline/bindings/fish"
    source /usr/share/powerline/bindings/fish/powerline-setup.fish
    powerline-setup
end

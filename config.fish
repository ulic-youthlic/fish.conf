#!/usr/bin/env fish
set -gx PAGER nvimpager
set -l cwd (dirname (readlink -m (status --current-filename)))
set -U fish_greeting "Welcome! This is fish."

# Personal config
fish_vi_key_bindings
fish_config theme choose "Catppuccin Macchiato"


# Add functions
set fish_function_path $fish_function_path[1]\
                       $cwd/functions\
                       $fish_function_path[2..-1]

# Rust
if command -q cargo
    set PATH $PATH $HOME/.cargo/bin
end

# Haskell
if command -q ghcup
    set PATH $PATH $HOME/.ghcup/bin
end

# python-pipx
if command -q pipx
    set PATH $PATH $HOME/.local/bin
end

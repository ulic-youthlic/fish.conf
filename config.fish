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

# Nvimpager
if command -q nvimpager
    set -gx PAGER nvimpager
end

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

# set NVM-DIR
if not set -q NVM_DIR
    if test -e /usr/share/nvm
        set -xg NVM_DIR /usr/share/nvm
    else if test -e {$HOME}/.nvm
        set -xg NVM_DIR {$HOME}/.nvm
    end
end

if command -q pipx
    fish_add_path -amg $HOME/.local/bin
else
    _warn_no_command pipx
end

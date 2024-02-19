if command -q cargo
    fish_add_path -amg $HOME/.cargo/bin
else
    _warn_no_command cargo
end

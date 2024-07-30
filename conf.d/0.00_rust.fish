if command -q cargo
    if set -q CARGO_HOME
        fish_add_path -amg $CARGO_HOME/bin
    else
        fish_add_path -amg $HOME/.cargo/bin
    end
else
    _warn_no_command cargo
end

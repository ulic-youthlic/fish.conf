if command -q starship
    set -gx STARSHIP_CONFIG $HOME/.config/starship/config.toml
    starship init fish | source
else
    _warn_no_command starship
end

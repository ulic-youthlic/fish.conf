if command -q atuin
    atuin init fish | source
else
    _warn_no_command atuin
end

if command -q pyenv
    pyenv init - | source
else
    _warn_no_command pyenv
end

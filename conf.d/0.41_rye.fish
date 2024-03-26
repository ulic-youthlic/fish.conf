if command -q rye
    fish_add_path -pmg "$HOME/.rye/shims"
else
    _warn_no_command rye
end

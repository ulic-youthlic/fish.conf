if command -q bob
    fish_add_path -pmg $HOME/.local/share/bob/nvim-bin
else
    _warn_no_command bob
end

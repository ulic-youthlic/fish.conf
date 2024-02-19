if command -q bob
    fish_add_path -amg $HOME/.local/share/bob/nvim-bin
else
    _warn_no_command bob
end

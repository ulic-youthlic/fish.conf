if command -q nvimpager; and command -q nvim
    set -gx PAGER nvimpager
else
    _warn_no_command "nvimpager or nvim"
end

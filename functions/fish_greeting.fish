function fish_greeting
    if command -q fastfetch
        fastfetch
    else if command -q zeitfetch
        zeitfetch
    else if command -q neofetch
        neofetch
    else
        _warn_no_command zeitfetch
    end
end

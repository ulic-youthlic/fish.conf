function fish_greeting
    if command -q zeitfetch
        zeitfetch
    else if command -q neofetch
        neofetch
    end
end

if command -q eza
    function ls
        eza --icons=auto $argv
    end
end

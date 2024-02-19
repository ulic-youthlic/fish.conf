if command -q eza
    function ls
        eza --icons=always $argv
    end
end

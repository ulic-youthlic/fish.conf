if command -q eza
    function ll
        ls -hlG --smart-group --git $argv
    end
end

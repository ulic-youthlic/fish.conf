if command -q eza
    function ll
        ls -hlG --smart-group --git $argv
    end
else
    function ll
        ls -hlt $argv
    end
end

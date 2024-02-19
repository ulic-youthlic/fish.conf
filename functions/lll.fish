if command -q eza
    function lll
        ll -A $argv
    end
else
    function lll --wraps='ll -ath' --description 'alias lll ll -ath'
        ll -Ath $argv
    end
end

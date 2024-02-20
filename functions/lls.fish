if command -q eza
    function lls
        ls -hlA --smart-group --git
    end
end

if command -q neovide
    function nvide --wraps=neovide --description 'alias nvide neovide'
    neovide $argv
            
    end
end

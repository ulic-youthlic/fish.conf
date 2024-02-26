if set -q BASE_CONFIG_DIR; and command -q git
    function bconf
        git --git-dir="$BASE_CONFIG_DIR" --work-tree="$HOME" $argv
    end
end

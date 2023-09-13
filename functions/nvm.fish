if not set -q NVM_DIR
    if test -e /usr/share/nvm
        set -g NVM_DIR /usr/share/nvm
    else if test -e {$HOME}/.nvm
        set -g NVM_DIR {$HOME}/.nvm
    end
end
if set -q NVM_DIR
    function nvm
        bass source {$NVM_DIR}/nvm.sh --no-use ';' nvm $argv
    end
end

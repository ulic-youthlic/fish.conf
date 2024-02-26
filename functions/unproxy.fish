if functions -q proxy; or command -q mihomo; or test -e $__fish_config_dir/.wsl
    function unproxy
        set -e HTTP_PROXY
        set -e HTTPS_PROXY
        set -e https_proxy
        set -e http_proxy
    end
end

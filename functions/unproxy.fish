if functions -q proxy
    function unproxy
        set -e HTTP_PROXY
        set -e HTTPS_PROXY
        set -e https_proxy
        set -e http_proxy
    end
end

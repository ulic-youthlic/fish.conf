if command -q clash
    function proxy
        set -gx http_proxy 'http://127.0.0.1:7890'
        set -gx https_proxy 'http://127.0.0.1:7890'
        set -gx HTTP_PROXY 'http://127.0.0.1:7890'
        set -gx HTTPS_PROXY 'http://127.0.0.1:7890'
    end
end

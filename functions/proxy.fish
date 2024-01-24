if command -q clash
    function proxy
        echo 127.0.0.1
        set -gx http_proxy 'http://127.0.0.1:7890'
        set -gx https_proxy 'http://127.0.0.1:7890'
        set -gx HTTP_PROXY 'http://127.0.0.1:7890'
        set -gx HTTPS_PROXY 'http://127.0.0.1:7890'
    end
else if test -e $__fish_config_dir/.wsl
    function proxy
        set -l host_ip (ip route show | grep -i default | awk '{ print $3}')
        echo $host_ip
        set -xg http_proxy "http://$host_ip:7890"
        set -xg HTTP_PROXY $http_proxy
        set -xg https_proxy $http_proxy
        set -xg HTTPS_PROXY $http_proxy
    end
end

function fish_right_prompt
    set -l duration_sec (math $CMD_DURATION / 1000)
    printf '%s%gs' (set_color green --bold) $duration_sec
    set_color normal
end

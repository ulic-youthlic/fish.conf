function fish_prompt --description 'Informative prompt'
    #Save the return status of the previous command
    set -l last_pipestatus $pipestatus
    set -lx __fish_last_status $status # Export for __fish_print_pipestatus.

    set -l status_color (set_color $fish_color_status)
    set -l statusb_color (set_color --bold $fish_color_status)
    set -l pipestatus_string (__fish_print_pipestatus "[" "]" "|" "$status_color" "$statusb_color" $last_pipestatus)

    printf '|%s| %s[%s@%s] %s%s %s%s' (date "+%H:%M:%S") (set_color brblue) \
        $USER (prompt_hostname) (set_color $fish_color_cwd) $PWD $pipestatus_string
        
    # write_fish_vcs_prompt
    set -g __fish_git_prompt_showdirtystate 1
    set -g __fish_git_prompt_showstashstate 1
    set -g __fish_git_prompt_showuntrackedfiles 1
    set -g __fish_git_prompt_showupstream 1
    set -g __fish_git_prompt_showupstream informative
    set -g __fish_git_prompt_show_informative_status 1
    set -g __fish_git_prompt_hide_untrackedfiles 0
    set -g __fish_git_prompt_describe_style branch

    set -g __fish_git_prompt_color_dirtystate blue
    set -g __fish_git_prompt_color_stagedstate yellow
    set -g __fish_git_prompt_color_invalidstate red
    set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
    set -g __fish_git_prompt_color_cleanstate --bold green

    set -g __fish_git_prompt_char_dirtystate '⚡'
    set -g __fish_git_prompt_char_stagedstate '→'
    set -g __fish_git_prompt_char_untrackedfiles '⚑'
    set -g __fish_git_prompt_char_stashstate '↩'
    set -g __fish_git_prompt_char_upstream_ahead '+'
    set -g __fish_git_prompt_char_upstream_behind '-'

    printf '%s%s%s' (set_color $fish_color_normal) (fish_vcs_prompt)

    if test $TERM = 'linux'
        printf " power:%d%%" (cat /sys/class/power_supply/BAT0/capacity)
    end


    set -l PS1 '>'
    echo -e '\n'$PS1' '
end

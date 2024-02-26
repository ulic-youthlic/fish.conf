#!/usr/bin/env fish

function block_key
    echo -e "Input any kay to continue: "
    read wait
end

# Check whether `__fish_config_dir` exists
# If not find `__fish_config_dir`, make this dir and set default `__fish_config_dir` to `$HOME/.config/fish`
echo "==> Find `__fish_config_dir`"
if not set -q __fish_config_dir
    echo 'Cannot find variable, __fish_config_dir'
    printf "Do you want to `mkdir -p %s`, and set it as __fish_config_dir?(y/n)\n" "$HOME/.config/fish"
    read choice
    if test "$choice" = "y"
        printf "Set var __fish_config_dir as `%s` and create the dir\n" "$__fish_config_dir"
        mkdir -p {$HOME}/.config/fish
        set -Ux __fish_config_dir {$HOME}/.config/fish
    else
        echo "Con NOT find `__fish_config_dir`, EXIT;"
        exit
    end
else
    printf "Find `__fish_config_dir`: %s\n" "$__fish_config_dir"
end
echo "==> Finish finding `__fish_config_dir`"
block_key

# Set local variable
set -l cwd (dirname (readlink -m (status --current-filename)))
set -l custom_file {$cwd}/config.fish
set -l config_file {$__fish_config_dir}/config.fish
printf "==> Deal with `%s`\n" "$config_file"
if not test -e $config_file
    printf "Can NOT fund config file: `%s`\n" "$config_file"
    echo "Do you want to create it?(y/n)"
    read create_config
    if test "$create_config" = "y"
        printf "Creating config file: %s\n" "$config_file"
        touch "$config_file"
    else
        printf "Can NOT find config file: %s. EXIT;" "$config_file"
        exit
    end
end
set -l config_content (cat $config_file)
if string match -r ".*$custom_file.*" $config_content 1> /dev/null
    printf "Find %s in %s\n" "$custom_file" "$config_file"
    echo "Init has finished. EXIT;"
    exit
else
    echo "Write the following command into $config_file"
    echo ''
    echo '# source dotfile from ulic-youthlic/fish.conf' >> $config_file
    echo '# source dotfile from ulic-youthlic/fish.conf'
    printf "source %s\n" "$custom_file" >> $config_file
    printf "source %s\n" "$custom_file"
    echo ''
end
echo "==> Finish dealing with %s" $config_file
block_key

# check whether wsl env or not
echo "==> Deal with WSL env"
set -l wsl_file "$__fish_config_dir/.wsl"
echo "This configuration will impact on fish function `proxy` and `unproxy`"
if not test -e $wsl_file
    echo 'Is it wsl?(y/n)'
    read wsl
    if test "$wsl" = "y"
        printf "Create sign file: %s\n" "$wsl_file"
        touch "$wsl_file"
    end
else
    printf "Find file `%s`\n" "$wsl_file"
    echo "Confirm fish running in the wsl env"
end
echo "==> Finish dealing with WSL env"
block_key

# Deal with plugins file
set -l old_plugins {$__fish_config_dir}/fish_plugins
set -l new_plugins {$cwd}/fish_plugins
printf "==> Deal with fish_plugins file: %s\n" "$old_plugins"
echo "This configuration use `fisher` as fish plugin manager"
if not test -e $old_plugins
    printf "Not find fish_plugins file for `fisher`, creating symlink from %s to %s\n" "$new_plugins" "$old_plugins"
else
    printf "Find fish_plugins file for `fisher`, appending it to %s, creating symlink from %s to %s\n" "$new_plugins" "$new_plugins" "$old_plugins"
    cat $old_plugins >> $new_plugins
    rm $old_plugins
end
ln -s $new_plugins $old_plugins
printf "==> Finish deal with fish_plugins file: %s\n" "$old_plugins"
block_key

# Set fish as default shell
set -l default_shell (awk -F: -v user=(whoami) '$1 == user {print $NF}' /etc/passwd)
echo "==> Deal with default shell"
if string match --regex "bash" "$default_shell" 1> /dev/null; or string match --regex "zsh" "$default_shell" 1> /dev/null
    echo "Default shell is $default_shell"
    echo "Does you want to make bash launch fish shell automatically when bash launched?(y/n)"
    read confirm
    if test "$confirm" = "y"
        printf "Append the following into your `%s/.bashrc`\n" "$HOME"
        echo ''
        cat $cwd/bashrc.sample >> $HOME/.bashrc
        cat $cwd/bashrc.sample
        echo ''
    end
end
echo "==> Finish dealing with default shell"

# Init finished
echo "Init finished"

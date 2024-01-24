#!/usr/bin/env fish

# Check whether `__fish_config_dir` exists
# If not find `__fish_config_dir`, make this dir and set default `__fish_config_dir` to `$HOME/.config/fish`
if not set -q __fish_config_dir
    echo 'Cannot find variable, __fish_config_dir'
    printf "Do you want to `mkdir -p %s`, and set it as __fish_config_dir?(y/n)\n" "$HOME/.config/fish"
    read choice
    if test "$choice" = "y"
        mkdir -p {$HOME}/.config/fish
        set -gx __fish_config_dir {$HOME}/.config/fish
    else
        exit
    end
end

# Set local variable
set -l cwd (dirname (readlink -m (status --current-filename)))
set -l custom_file {$cwd}/config.fish
set -l config_file {$__fish_config_dir}/config.fish

if not test -e $config_file; or not cat $config_file | grep $custom_file > /dev/null
    echo -e "Write the following command into" $config_file ":\n"
    echo '# source dotfile from ulic-youthlic/Dotfile-Fish'
    echo '# source dotfile from ulic-youthlic/Dotfile-Fish' >> $config_file
    echo "source" $custom_file
    echo "source" $custom_file >> $config_file
    echo ''
end

# check whether wsl env or not
set -l wsl_file $cwd/.wsl
echo "Check if it is a WSL environment..."
if not test -e $wsl_file
    echo 'Is it wsl?(y/n)'
    read wsl
    if test "$wsl" = "y"
        touch $wsl_file
    end
end

# Deal with plugins file
set -l old_plugins {$__fish_config_dir}/fish_plugins
set -l new_plugins {$cwd}/fish_plugins
if not test -e $old_plugins
    printf "Not find fish_plugins file for `fisher`, creating symlink from %s to %s\n" $new_plugins $old_plugins
else
    printf "Find fish_plugins file for `fisher`, appending it to %s, creating symlink from %s to %s\n" $new_plugins $new_plugins $old_plugins
    echo '' >> $new_plugins
    cat $old_plugins >> $new_plugins
    rm $old_plugins
end
ln -s $new_plugins $old_plugins

# Set fish as default shell
set -l default_shell (awk -F: -v user=(whoami) '$1 == user {print $NF}' /etc/passwd)
if string match --regex bash "$default_shell" 1> /dev/null
    echo "Default shell is $default_shell"
    echo "Does bash start the fish shell by default?(y/n)"
    read confirm
    if test "$confirm" = "y"
        cat $cwd/bashrc.sample >> $HOME/.bashrc
    end
end


# Install plugins
if functions -q fisher
    fisher update
else
    echo "WARN: Can't find plugin manager, `fisher`."
end

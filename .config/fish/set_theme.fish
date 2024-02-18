function set_theme
    set -l cfg $HOME/.config
    set -l kitty_theme_overrides $cfg/kitty/theme.conf
    set -l kitty_theme $cfg/kitty/themes/catppuccin/mocha.conf

    if is_system_appearence_dark
        sd latte mocha $cfg/bat/config

        ln -sf $cfg/kitty/themes/catppuccin_dark.conf $kitty_theme_overrides

        # change_theme "Catppuccin Mocha"
        fish_config theme save "Catppuccin Mocha"
    else
        sd mocha latte $cfg/bat/config

        set kitty_theme $cfg/kitty/themes/catppuccin/latte.conf
        ln -sf $cfg/kitty/themes/catppuccin_light.conf $kitty_theme_overrides

        # change_theme "Catppuccin Latte"
        fish_config theme save "Catppuccin Latte"
    end

    if set -q KITTY_WINDOW_ID
        kitty @ --password="fish_shell" set-colors -ac $kitty_theme
        kitty @ --password="fish_shell" set-colors -ac $kitty_theme_overrides
    end
end

function is_system_appearence_dark
    test Dark = (defaults read -g AppleInterfaceStyle 2>/dev/null) 2>/dev/null
end

# Extracted from the native fish_config function
function change_theme --d "Sets current prompt theme"
    set -l dirs $__fish_config_dir/themes $__fish_data_dir/tools/web_config/themes

    set -l scope -g
    set -l have_colors

    set -l known_colors fish_color_{normal,command,keyword,quote,redirection,\
        end,error,param,option,comment,selection,operator,escape,autosuggestion,\
        cwd,user,host,host_remote,cancel,search_match} \
        fish_pager_color_{progress,background,prefix,completion,description,\
        selected_background,selected_prefix,selected_completion,selected_description,\
        secondary_background,secondary_prefix,secondary_completion,secondary_description}

    set -l files $dirs/$argv[1].theme
    set -l file

    for f in $files
        if test -e "$f"
            set file $f
            break
        end
    end

    if not set -q file[1]
        echo "No such theme: $argv[1]" >&2
        echo "Searched directories: $dirs" >&2
        return 1
    end

    # Variables a theme is allowed to set
    set -l theme_var_filter '^fish_(?:pager_)?color.*$'

    while read -lat toks
        # The whitelist allows only color variables.
        # Not the specific list, but something named *like* a color variable.
        # This also takes care of empty lines and comment lines.
        string match -rq -- $theme_var_filter $toks[1]
        or continue

        # If we're supposed to set universally, remove any shadowing globals
        # so the change takes effect immediately (and there's no warning).
        if test x"$scope" = x-U; and set -qg $toks[1]
            set -eg $toks[1]
        end

        set $scope $toks
        set -a have_colors $toks[1]
    end <$file

    # Set all colors that aren't mentioned to empty
    for c in $known_colors
        contains -- $c $have_colors
        and continue

        # Erase conflicting global variables so we don't get a warning and
        # so changes are observed immediately.
        set -eg $c
        set $scope $c
    end

    # If we've made it this far, we've either found a theme file or persisted the current
    # state (if any). In all cases we haven't failed, so return 0.
    return 0
end

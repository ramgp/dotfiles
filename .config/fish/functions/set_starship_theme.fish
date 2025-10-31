# STARSHIP_THEME selects a palette without modifying the shared Starship config.
function set_starship_theme --on-variable STARSHIP_THEME
    set -l base_config "$XDG_CONFIG_HOME/starship.toml"
    set -gx STARSHIP_CONFIG "$base_config"

    switch "$STARSHIP_THEME"
        case '' catppuccin_mocha
            return 0
        case rose_pine
            set -l cache_dir "$XDG_CACHE_HOME/starship"
            command mkdir -p "$cache_dir"; or return

            set -l temporary_config (command mktemp "$cache_dir/rose_pine.XXXXXX"); or return
            if string replace --regex '^palette = "catppuccin_mocha"$' 'palette = "rose_pine"' < "$base_config" > "$temporary_config"
                command mv -f "$temporary_config" "$cache_dir/rose_pine.toml"; or return
                set -gx STARSHIP_CONFIG "$cache_dir/rose_pine.toml"
            else
                command rm -f "$temporary_config"
                return 1
            end
        case '*'
            printf 'Unknown STARSHIP_THEME "%s"; using catppuccin_mocha.\n' "$STARSHIP_THEME" >&2
            return 1
    end
end

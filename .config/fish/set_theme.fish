function set_theme
    set -l cfg $HOME/.config

    if is_system_appearence_dark
        # sd '"catppuccin_latte"' '"catppuccin_mocha"' "$cfg/starship.toml"

        set -Ux FZF_DEFAULT_OPTS "\
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--cycle --layout=reverse --border --height=90% \
--preview-window=wrap --marker=\"*\""

        fish -c yes | fish_config theme save "Catppuccin Mocha"
    else
        # sd '"catppuccin_mocha"' '"catppuccin_latte"' "$cfg/starship.toml"

        set -Ux FZF_DEFAULT_OPTS "\
--color=bg+:#ccd0da,bg:#eff1f5,spinner:#dc8a78,hl:#d20f39 \
--color=fg:#4c4f69,header:#d20f39,info:#8839ef,pointer:#dc8a78 \
--color=marker:#dc8a78,fg+:#4c4f69,prompt:#8839ef,hl+:#d20f39 \
--cycle --layout=reverse --border --height=90% \
--preview-window=wrap --marker=\"*\""

        fish -c yes | fish_config theme save "Catppuccin Latte"
    end
end

function is_system_appearence_dark
    test Dark = (defaults read -g AppleInterfaceStyle 2>/dev/null) 2>/dev/null
end

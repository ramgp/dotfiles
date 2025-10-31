function moo --description 'A pipe-friendly random cowsay that respects newlines'
    set -l toon (random choice default bud-frogs dragon dragon-and-cow elephant moose stegosaurus tux vader)
    set -l color cat
    command -sq lolcat; and set color lolcat

    begin
        if not isatty stdin
            cat
        else if set -q argv[1]
            printf '%b\n' "$argv"
        else if command -sq fortune
            fortune -s
        else
            printf '%s\n' 'Something fishy...'
        end
    end | cowsay -n -W 100 -f "$toon" | $color
end

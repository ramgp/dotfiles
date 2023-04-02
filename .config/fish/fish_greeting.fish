function fish_greeting
    if not command -sq fortune
        switch (uname)
            case Darwin
                echo Installing fortune and cowsay
                brew install fortune cowsay
                # sudo gem install lolcat
            case Linux
                echo Installing fortune and cowsay
                if not command -sq apt-get
                    sudo apt install fortune cowsay
                else
                    sudo dnf install fortune cowsay
                end
            case '*'
                echo Wait ... where are we\? (uname), eh
        end
    end

    set -l toon (random choice {default,bud-frogs,dragon,dragon-and-cow,elephant,moose,stegosaurus,tux,vader})
    if command -sq lolcat
        fortune -s | cowsay -f $toon | lolcat
    else if command -sq fortune
        fortune -s | cowsay -f $toon
    else
        echo Something fishy going on around here ...
    end
end

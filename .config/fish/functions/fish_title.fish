function fish_title
    # emacs' "term" is basically the only term that can't handle it.
    if not set -q INSIDE_EMACS; or string match -vq '*,term:*' -- $INSIDE_EMACS
        # If we're connected via ssh, we print the hostname.
        set -l ssh
        set -q SSH_TTY
        and set ssh "["(prompt_login | string sub -l 20 | string collect)"]"
        # An override for the current command is passed as the first parameter.
        # This is used by `fg` to show the true process name, among others.

        # prompt_pwd -d 1 -D 1
        set -l current_path (pwd)
        set -l home_path $HOME

        # Replace home with ~
        set current_path (string replace $home_path "~" $current_path)

        # Split path into components
        set -l path_parts (string split "/" $current_path)

        # If more than 4 parts (matching truncation_length = 4)
        if test (count $path_parts) -gt 4
            # Show truncation symbol + last 4 parts
            # set -l truncated_parts $path_parts[-4..-1]
            # set current_path "../"(string join "/" $truncated_parts)
            set current_path $path_parts[1]"/"$path_parts[2]"/.../"(string join "/" $path_parts[-2..-1])
        end

        if set -q argv[1]
            echo -- $ssh (string sub -l 40 -- $argv[1]): $current_path
        else
            # Don't print "fish" because it's redundant
            set -l command (status current-command)
            if test "$command" = fish
                set command
            end
            echo -- $ssh (string sub -l 40 -- $command) $current_path
        end
    end
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    set -g fish_greeting
    abbr --add lf lfcd
    fzf --fish | source
end

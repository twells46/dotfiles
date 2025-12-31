if status is-interactive
    # Commands to run in interactive sessions can go here
    set -g fish_greeting
    abbr --add lf lfcd
    fzf --fish | source

    # Set fish_key_bindings globally per 4.3 update instructions
    set --global fish_key_bindings fish_default_key_bindings
end

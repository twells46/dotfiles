if status is-interactive
    # Commands to run in interactive sessions can go here
    set -g fish_greeting
    abbr --add lf lfcd
    #starship init fish | source
    fzf --fish | source

end

function fish_prompt
    set -l last_status $status
    # Prompt status only if it's not 0
    set -l stat
    if test $last_status -ne 0
        set stat (set_color red)" [$last_status] "(set_color normal)
    end

    string join '' -- (set_color green) (prompt_pwd -D 50) (set_color normal) $stat '> '
end

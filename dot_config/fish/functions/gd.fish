function gd
    cd (fd -u -t d | fzf --reverse --header="Jump to location" -q "$argv")
end

declare-option -docstring "shell command run to find a file or directory" \
    str findcmd 'fd -tf -H'

provide-module find %{

require-module jump

define-command -params .. -docstring %{
    find [<arguments>]: find utility wrapper
    All optional arguments are forwarded to the find utility
    Passing no argument will perform a literal-string search for the current selection
} find %{ evaluate-commands %sh{
    if [ $# -eq 0 ]; then
        case "$kak_opt_findcmd" in
        fd\ * | git\ grep\ * | grep\ * | rg\ * | ripgrep\ * | ugrep\ * | ug\ *)
            set -- -F "${kak_selection}"
            ;;
        *)
            set -- "${kak_selection}"
            ;;
        esac
    fi

     output=$(mktemp -d "${TMPDIR:-/tmp}"/kak-find.XXXXXXXX)/fifo
     mkfifo ${output}
     ( { trap - INT QUIT; ${kak_opt_findcmd} "$@" 2>&1 | tr -d '\r'; } > ${output} 2>&1 & ) > /dev/null 2>&1 < /dev/null

     printf %s\\n "evaluate-commands -try-client '$kak_opt_toolsclient' %{
               edit! -fifo ${output} *find*
               set-option buffer filetype find
               set-option buffer jump_current_line 0
               hook -always -once buffer BufCloseFifo .* %{ nop %sh{ rm -r $(dirname ${output}) } }
           }"
}}
complete-command find file

hook -group find-highlight global WinSetOption filetype=find %{
    add-highlighter window/find group
    add-highlighter window/find/ regex "^(.+)" 1:cyan
    add-highlighter window/find/ line %{%opt{jump_current_line}} default+b
    hook -once -always window WinSetOption filetype=.* %{ remove-highlighter window/find }
}

hook global WinSetOption filetype=find %{
    hook buffer -group find-hooks NormalKey <ret> jump
    hook -once -always window WinSetOption filetype=.* %{ remove-hooks buffer find-hooks }
}

define-command -hidden find-jump %{
    jump
}

define-command find-next-match -docstring %{alias for "jump-next *find*"} %{
    jump-next -matching \*find(-.*)?\*
}

define-command find-previous-match -docstring %{alias for "jump-previous *find*"} %{
    jump-previous -matching \*find(-.*)?\*
}

}

hook -once global KakBegin .* %{ require-module find }

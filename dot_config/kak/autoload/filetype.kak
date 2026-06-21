# Remove kakoune stdlib file detection and replace it with customized version.
# Corrects highlighting in shell scripts when using shebangs that `file -b` doesn't pick up.
remove-hooks global file-detection

define-command -hidden filetype %{ evaluate-commands %sh{
    if [ -z "${kak_opt_filetype}" ]; then
        mime=$(file -b --mime-type -L "${kak_buffile}")
        mime=${mime%;*}
        case "${mime}" in
            application/*+xml) filetype="xml" ;;
            image/*+xml) filetype="xml" ;; #SVG
            message/rfc822) filetype="mail" ;;
            text/x-shellscript) filetype="sh" ;;
            text/x-script.*) filetype="${mime#text/x-script.}" ;;
            text/x-*) filetype="${mime#text/x-}" ;;
            text/plain)
            read -r first_line < "${kak_buffile}"
            case "${first_line}" in
                '#!'*'/sh'|\
                '#!'*'/bash'|\
                '#!'*'/dash'|\
                '#!'*'/zsh'|\
                '#!/usr/bin/env '*sh*) filetype="sh" ;;
                *) exit ;;
            esac
            ;;
            text/*)   filetype="${mime#text/}" ;;
            application/x-shellscript) filetype="sh" ;;
            application/x-*) filetype="${mime#application/x-}" ;;
            application/*) filetype="${mime#application/}" ;;
            *) exit ;;
        esac
        if [ -n "${filetype}" ]; then
            printf "set-option buffer filetype '%s'\n" "${filetype}"
        fi
    fi
} }

hook -group filetype global BufOpenFile .* filetype
hook -group filetype global BufWritePost .* filetype


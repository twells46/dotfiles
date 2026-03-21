# Pattern for communicating with kak via it's session socket
define-command sockettest %{
    nop %sh{ {
        sleep 10
        echo "eval -client '$kak_client' 'echo sleep ended'" |
            kak -p ${kak_session}
    } > /dev/null 2>&1 < /dev/null & }
}

# Pattern for communication with external programs via a fifo
define-command fifotest %{
    evaluate-commands %sh{
         # Create a temporary fifo for communication
         output=$(mktemp -d -t kak-temp-XXXXXXXX)/fifo
         mkfifo ${output}
         # run command detached from the shell
         { fzf > ${output} } > /dev/null 2>&1 < /dev/null &
         # Open the file in Kakoune and add a hook to remove the fifo
         echo "edit! -fifo ${output} *buffer-name*
               hook buffer BufClose .* %{ nop %sh{ rm -r $(dirname ${output})} }"
    }
}


# Trick to make compiler run async
hook global BufWritePost .*\.(md|tex|ms)$ %{
    nop %sh{ {
        compiler $"{kak_buffile}"
    } > /dev/null 2>&1 < /dev/null & }
}
 Simpler version
 hook global BufWritePost .*\.(md|tex)$ %{
     echo -debug %sh{compiler "${kak_buffile}"}
 }

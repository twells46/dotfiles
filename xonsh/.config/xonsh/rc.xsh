# XONSH WEBCONFIG START
$PROMPT = '{YELLOW}{env_name}{RESET}{GREEN}{cwd}{RESET} {RED}{last_return_code_if_nonzero:[{BOLD_INTENSE_RED}{}{RED}] }{RESET}{BOLD_BLUE}{prompt_end}{RESET} '
# XONSH WEBCONFIG END

xontrib load coreutils
xontrib load fish_completer

@aliases.register
@aliases.return_command
def _lfcd(args):
    # This returns a command
    # The outer $() runs a subshell, very similar to bash and co.
    # The @$(cmd) is a shorthand for @([i.strip() for i in $(cmd).split()]).
    # Essentially, it runs the output of the command as a command.
    # In this case, `which -s lf` gets the `lf` binary,
    # rather than the alias defined below.
    return ['cd', $(@$(which -s lf) -print-last-dir @(args))]

aliases['lf'] = 'lfcd'

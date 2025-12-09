# XONSH WEBCONFIG START
$PROMPT = '{YELLOW}{env_name}{RESET}{GREEN}{cwd}{RESET} {RED}{last_return_code_if_nonzero:[{BOLD_INTENSE_RED}{}{RED}] }{RESET}{BOLD_BLUE}{prompt_end}{RESET} '
# XONSH WEBCONFIG END

xontrib load coreutils
xontrib load fish_completer

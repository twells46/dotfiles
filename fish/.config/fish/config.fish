# Include user binaries
set -gxax PATH "$HOME/.local/bin"

set -gx EDITOR "kak"

# XDG
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_DATA_HOME "$HOME/.local/share"
set -gx XDG_CACHE_HOME "$HOME/.cache"

# Rust
set -gx CARGO_HOME "$XDG_DATA_HOME/rust/cargo"
set -gx RUSTUP_HOME "$XDG_DATA_HOME/rust/rustup"
#. "/home/tom/.local/share/rust/cargo/env"
#. "/var/home/tom/.local/share/rust/cargo/env"

# Go
set -gx GOPATH "$XDG_DATA_HOME/go"
set -gx GOMODCACHE "$XDG_CACHE_HOME/go/mod"

# Nvidia cache locations
set -gx __GL_SHADER_DISK_CACHE_PATH "$XDG_CACHE_HOME/nvidia/GLCache/"
set -gx CUDA_CACHE_LOCATION "$XDG_CACHE_HOME/nvidia/computeCache"

# Ollama
set -gx OLLAMA_NOHISTORY 1

# Plan9
set -gx PLAN9 "/usr/local/plan9"
set -gxax PATH "$PLAN9/bin"

set -gx MPD_HOST "$HOME/.local/share/mpd_socket"

# Misc.
# set -gx XINITRC "$XDG_CONFIG_HOME/x11/xinitrc"
# set -gx XAUTHORITY "$XDG_RUNTIME_DIR/Xauthority"
set -gx GTK2_RC_FILES "$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
set -gx WGETRC "$XDG_CONFIG_HOME/wget/wgetrc"
set -gx INPUTRC "$XDG_CONFIG_HOME/shell/inputrc"
set -gx GNUPGHOME "$XDG_DATA_HOME/gnupg"
set -gx PASSWORD_STORE_DIR "$XDG_DATA_HOME/password-store"
set -gx ANSIBLE_CONFIG "$XDG_CONFIG_HOME/ansible/ansible.cfg"
set -gx MBSYNCRC "$XDG_CONFIG_HOME/mbsync/config"
set -gx ELECTRUMDIR "$XDG_DATA_HOME/electrum"
set -gx PYTHONSTARTUP "$XDG_CONFIG_HOME/python/pythonrc"
set -gx SQLITE_HISTORY "$XDG_DATA_HOME/sqlite_history"
set -gx FZF_DEFAULT_OPTS "--reverse --height=50%"
set -gx _ZO_FZF_OPTS "--scheme=path --tiebreak=index --height=75% --reverse --border=rounded --no-scrollbar --preview=\"ls --color -al {2}\" --preview-window=right"
set -gx BAT_THEME "base16"
set -gx MANPAGER "less -R --use-color -Dd+r -Du+b"

set -g fish_greeting
if status is-interactive
    abbr --add lf lfcd

end

export EDITOR="/usr/bin/kak"

export PATH="$HOME/.local/bin:$PATH"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export MPD_HOST="$XDG_RUNTIME_DIR/mpd.sock"
export XINITRC="$XDG_CONFIG_HOME/x11/xinitrc"

export CARGO_HOME="$XDG_DATA_HOME/rust/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rust/rustup"

export GOPATH="$XDG_DATA_HOME/go"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$GOPATH/bin"

export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"
export SQLITE_HISTORY="$XDG_DATA_HOME/sqlite_history"

export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"

export FZF_DEFAULT_OPTS="--reverse --height=50%"
export _ZO_FZF_OPTS="--scheme=path --tiebreak=index --height=75% --reverse --border=rounded --no-scrollbar --preview=\"ls --color -al {2}\" --preview-window=right"
#export BAT_THEME="base16"
export MANPAGER="less -R --use-color -Dd+r -Du+b"

# Ollama
export OLLAMA_NOHISTORY=1

# Plan9
#export PLAN9="/usr/local/plan9"
#export PATH="$PATH:$PLAN9/bin"

# Misc.
# export XINITRC="$XDG_CONFIG_HOME/x11/xinitrc"
# export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export INPUTRC="$XDG_CONFIG_HOME/shell/inputrc"
export ANSIBLE_CONFIG="$XDG_CONFIG_HOME/ansible/ansible.cfg"
export MBSYNCRC="$XDG_CONFIG_HOME/mbsync/config"
export ELECTRUMDIR="$XDG_DATA_HOME/electrum"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"
export SQLITE_HISTORY="$XDG_DATA_HOME/sqlite_history"

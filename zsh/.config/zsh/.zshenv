# ~/.zshenv
# Loaded for every zsh invocation

# ---------- Zsh config location ----------
export ZDOTDIR="$HOME/.config/zsh"

# ---------- XDG base directories ----------
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# ---------- History location ----------
export HISTFILE="$XDG_STATE_HOME/zsh/history"

# ---------- Env Vars ----------------------
export PATH="$HOME/go/bin:$PATH"

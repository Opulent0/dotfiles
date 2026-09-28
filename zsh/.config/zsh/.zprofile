# ~/.zprofile
# Login shell configuration

# ---------- PATH setup ----------

# User-local executables
export PATH="$HOME/.local/bin:$PATH"

# Personal scripts
export PATH="$HOME/.config/bin:$PATH"

# ---------- Environment ----------

# Preferred editor
export EDITOR="emacsclient"
export VISUAL="emacsclient"

# Pager
export PAGER="less"
export LESS="-R"

# Language defaults
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# ---------- Session sanity ----------

# Ensure XDG dirs exist
mkdir -p "$HOME/.cache" "$HOME/.config" "$HOME/.local/share"


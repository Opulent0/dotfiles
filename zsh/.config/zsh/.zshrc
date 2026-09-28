# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ~/.zshrc
# Interactive shell configuration

# ---------- Safety ----------
# Only run in interactive shells
[[ -o interactive ]] || return

# ---------- History ----------
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY
setopt SHARE_HISTORY

# ---------- Shell behavior ----------
setopt AUTO_CD
setopt EXTENDED_GLOB
setopt INTERACTIVE_COMMENTS
setopt NO_BEEP

# ---------- Completion system ----------

autoload -Uz compinit

# Use cache for faster startup
compinit -d "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump"

# ---------- zsh-autocomplete ----------
[[ -r "$HOME/.local/share/zsh-plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh" ]] && \
  source "$HOME/.local/share/zsh-plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh"

# ---------- Completion behavior ----------

setopt GLOBDOTS

# Prefer expansion and files over commands
zstyle ':completion:*' completer _expand _files _complete

# Do not complete commands when completing arguments
zstyle ':completion:*:*:-command-:*:*' ignored-patterns '*'

# Variable and case handling
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Directories first
zstyle ':completion:*' list-dirs-first true

# ---------- zsh-autocomplete tuning ----------

# Start completion automatically
zstyle ':autocomplete:*' delay 0.1

# Do not require TAB to show menu
zstyle ':autocomplete:*' min-input 1

# Use a menu-style list
zstyle ':completion:*' menu select

# Do not accept completion on TAB
zstyle ':autocomplete:*' use-tab false

# Group results cleanly
zstyle ':completion:*' group-name ''

# ---------- Autocomplete keybindings ----------

# Use menu navigation
bindkey '^I' menu-complete          # TAB
bindkey '^[[Z' reverse-menu-complete # Shift+TAB

# Powerlevel10k theme
[[ -r "$HOME/.local/share/zsh-plugins/powerlevel10k/powerlevel10k.zsh-theme" ]] && \
  source "$HOME/.local/share/zsh-plugins/powerlevel10k/powerlevel10k.zsh-theme"

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

[[ -r "$HOME/.local/share/../bin/env" ]] && . "$HOME/.local/share/../bin/env"

# Aliases
alias emc='emacsclient -nc'
alias emcq='emacsclient -nc > /dev/null; exit'

export PATH=~/.npm-global/bin:"$HOME/.local/share/../bin":"$HOME/.config/bin":"$HOME/.local/bin":/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl

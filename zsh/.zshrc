# ---- ZINIT ----
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"
# ---------------

# ---- QoL plugins ----
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
# ---------------------

# ---- Completions ----
autoload -Uz compinit 
# zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
# zstyle ':completion:*' matcher-list '' '+m:{[:lower:]}={[:upper:]}' '+m:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=** r:|=** l:|=*'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu no
compinit -C
# ---------------------

# ---- HISTORY ----
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
# -----------------

# ---- keybindings ----
bindkey -e

autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

bindkey "^[OA" history-beginning-search-backward-end
bindkey "^[OB" history-beginning-search-forward-end
# ---------------------

# ---- Syntax highlighting ----
zinit light zsh-users/zsh-syntax-highlighting # Must be invoked after all zle -N calls and compinit
# -----------------------------

# ---- aliases ----
alias ls='eza -1 --icons=always --color=always'
alias cl='clear; fastfetch -l nixos_old_small --logo-padding-left 1 --logo-padding-right 3'
alias lg='lazygit status'
alias sv='sudo -E nvim'
alias nv='nvim'
alias ..='cd ..'
# -----------------

# ---- some random stuff ----
export MANPAGER="nvim +Man!"
export EDITOR="nvim"
eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"
# ---------------------------

# ---- fd for fzf ----
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}
# --------------------


# ---- MUST STAY AT BOTTOM --------------------------------------------------

fastfetch -l nixos_old_small --logo-padding-left 1 --logo-padding-right 3

# ---- yazi shell wrapper ----
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
# ----------------------------

# ---- STARSHIP ----
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

TRANSIENT_PROMPT="${PROMPT// prompt / prompt --profile transient }"
TRANSIENT_RPROMPT="${PROMPT// prompt / prompt --profile rtransient }"

autoload -Uz add-zle-hook-widget
add-zle-hook-widget zle-line-finish transient-prompt

function transient-prompt() {
    PROMPT="$TRANSIENT_PROMPT" RPROMPT="$TRANSIENT_RPROMPT" zle .reset-prompt
}
# ------------------

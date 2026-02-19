# ─── Meta & XDG ──────────────────────────────────────────────────
[[ $- != *i* ]] && return
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

# ─── Zinit (Turbo Mode & Performance) ────────────────────────────
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# Turbo mode(wait)를 사용해 터미널 로딩 속도 극대화
zinit wait'0' lucid for \
    atinit"zicompinit; zicdreplay" \
        zsh-users/zsh-completions \
    light-mode \
        zsh-users/zsh-autosuggestions \
        zsh-users/zsh-syntax-highlighting \
        zsh-users/zsh-history-substring-search

# ─── History & Keybinds ──────────────────────────────────────────
HISTSIZE=5000
HISTFILE="$XDG_STATE_HOME/zsh/history"
SAVEHIST=$HISTSIZE
setopt appendhistory sharehistory hist_ignore_all_dups
bindkey -e
bindkey '^[[1;5C' forward-word       # Ctrl+Right
bindkey '^[[1;5D' backward-word      # Ctrl+Left

# Ctrl-X, Ctrl-E로 현재 명령어를 Neovim에서 편집
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

# ─── Completion ─────────────────────────────────────────────────
zstyle ':completion:*' matcher-list \
    'm:{a-zA-Z}={A-Za-z}' \
    'r:|=*' \
    'l:|=* r:|=*'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu select
zstyle ':completion:*:default' list-colors 'di=34' 'ln=36' 'ex=32'

# ─── Aliases & Hacks ─────────────────────────────────────────────
alias ls='eza --icons --color=always'
alias ll='eza --icons --color=always -l'
alias la='eza --icons --color=always -la'
alias lt='eza --icons --color=always -a --tree --level=1 --git-ignore'
alias vim='nvim'
alias vi='nvim'
alias bat='bat --paging=never'
alias lzg='lazygit'
alias lzd='lazydocker'
alias sz='source $ZDOTDIR/.zshrc'
alias vz='vim $ZDOTDIR/.zshrc'

# Global Aliases (명령어 어디서든 작동)
alias -g G='| grep'
alias -g L='| less'
alias -g NE='2>/dev/null'

# Suffix Aliases (파일 이름만 쳐서 실행)
alias -s {json,md}=bat
alias -s {go,py,js,ts,c,cpp}=nvim


# ─── OS Specific ─────────────────────────────────────────────────
case "$OSTYPE" in
    darwin*)
        [[ -f $ZDOTDIR/.zshrc.mac ]] && source $ZDOTDIR/.zshrc.mac
        ;;
    linux*)
        if [ -f /etc/arch-release ]; then
            [[ -f $ZDOTDIR/.zshrc.arch ]] && source $ZDOTDIR/.zshrc.arch
        fi
        ;;
esac

# ─── Local Config (secrets, machine-specific) ────────────────────
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# opencode
export PATH=/Users/jk/.opencode/bin:$PATH
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/jk/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
# python.org Python 3.11
PATH="/Library/Frameworks/Python.framework/Versions/3.11/bin:$PATH"



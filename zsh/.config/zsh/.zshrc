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

# [영상 1&3 팁] Turbo mode(wait)를 사용해 터미널 로딩 속도 극대화
zinit wait'0' lucid for \
    atinit"zicompinit; zicdreplay" \
        zsh-users/zsh-completions \
    light-mode \
        zsh-users/zsh-autosuggestions \
        zsh-users/zsh-syntax-highlighting \
        Aloxaf/fzf-tab

# ─── History & Keybinds ──────────────────────────────────────────
HISTSIZE=5000
HISTFILE="$XDG_STATE_HOME/zsh/history"
SAVEHIST=$HISTSIZE
setopt appendhistory sharehistory hist_ignore_all_dups
bindkey -e
bindkey '^[[1;5C' forward-word       # Ctrl+Right
bindkey '^[[1;5D' backward-word      # Ctrl+Left

# [영상 5 팁] Ctrl-X, Ctrl-E로 현재 명령어를 Neovim에서 편집
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

# ─── FZF & Completion ────────────────────────────────────────────
eval "$(fzf --zsh)"
export FZF_DEFAULT_OPTS="--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 --color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC --color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 --color=selected-bg:#45475A --color=border:#313244,label:#CDD6F4"

zstyle ':completion:*' matcher-list 'm:{A-Za-z}={A-Za-z}'
zstyle ':fzf-tab:*' use-fzf-default-opts yes
zstyle ':fzf-tab:complete:*' fzf-preview '[[ -d $realpath ]] && eza --icons --tree --level=2 --color=always $realpath || bat -n --color=always --line-range :500 $realpath'

# ─── Aliases & Hacks ─────────────────────────────────────────────
# [영상 4&6 팁] 기본 도구 대체
alias ls='eza --icons --color=always'
alias ll='eza --icons --color=always -l'
alias la='eza --icons --color=always -a'
alias lt='eza --icons --color=always -a --tree --level=1 --git-ignore'
alias vim='nvim'
alias vi='nvim'
alias bat='bat --paging=never'
alias lzg='lazygit'
alias lzd='lazydocker'
alias sz='source $ZDOTDIR/.zshrc'
alias vz='vim $ZDOTDIR/.zshrc'

# [영상 5 팁] Global Aliases (명령어 어디서든 작동)
alias -g G='| grep'
alias -g L='| less'
alias -g NE='2>/dev/null'

# [영상 5 팁] Suffix Aliases (파일 이름만 쳐서 실행)
alias -s {json,md}=bat
alias -s {go,py,js,ts,c,cpp}=nvim

# [중요] Zinit의 zi와 충돌 해결
function zi() { cd "$(zoxide query -i "$@")" }

# ─── Tools Init ──────────────────────────────────────────────────
eval "$(zoxide init zsh)"
# [영상 3 팁] Oh My Posh 또는 Starship (설치되어 있다면 활성화)
# eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/zen.toml)"

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

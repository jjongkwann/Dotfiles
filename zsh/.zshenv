# ─── ZDOTDIR ────────────────────────────────────────────────────
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"

# ─── Homebrew PATH (must be set early) ──────────────────────────
case "$OSTYPE" in
    darwin*)
        eval "$(/opt/homebrew/bin/brew shellenv)"
        ;;
esac

# ─── Cargo ──────────────────────────────────────────────────────
[[ -f "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"

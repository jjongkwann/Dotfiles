# ─── ZDOTDIR ────────────────────────────────────────────────────
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"

# ─── Cargo ──────────────────────────────────────────────────────
[[ -f "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"

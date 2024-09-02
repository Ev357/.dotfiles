# starship
eval "$(starship init zsh)"

# fnm
FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$HOME/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# nvim
export PATH="$PATH:/opt/nvim-linux64/bin"
alias vim="nvim"

# git
alias undo="git reset --soft HEAD^"

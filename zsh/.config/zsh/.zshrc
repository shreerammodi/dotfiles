[ -f ~/.config/zsh/p10k-source.zsh ] && source ~/.config/zsh/p10k-source.zsh
[ -f ~/.local/share/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh ] && source ~/.local/share/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh
[ -f ~/.config/zsh/nnn.zsh ] && source ~/.config/zsh/nnn.zsh
[ -f ~/.config/zsh/fzf-tab-config.zsh ] && source ~/.config/zsh/fzf-tab-config.zsh

alias b="buku --suggest"
alias e="eza"
alias ea="eza --all"
alias el="eza --long --header --git --icons --classify --all"
alias et="eza --tree --level=2 --long --header --git --icons --classify --all"
alias lg="lazygit"
alias hl="hledger"
alias hl-roi='hledger roi --pretty --value=end,$ --infer-market-prices \
    --inv "assets:brokerage:individual" \
    --inv "assets:retirement:roth" \
    --pnl "income:capitalgains" \
    --pnl "income:dividends"'
alias rem="reminders"
alias spt="spotify_player"

setopt globdots
setopt autocd

fpath+=(~/.local/share/zsh/site-functions/)
fpath+=(/opt/homebrew/share/zsh/site-functions)

autoload -Uz compinit bashcompinit
compinit
bashcompinit

autoload edit-command-line; zle -N edit-command-line
bindkey -e
bindkey '^e' edit-command-line

eval "$(zoxide init zsh)"

function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

[ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && \
  source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f /opt/homebrew/opt/fzf/shell/key-bindings.zsh ] && source /opt/homebrew/opt/fzf/shell/key-bindings.zsh

eval "$(/usr/libexec/path_helper)"
eval "$(/opt/homebrew/bin/brew shellenv)"

path+=(~/.local/bin)
path+=(~/node_modules/.bin)
path+=(~/.orbstack/bin)

path+=(~/.cargo/bin)

# Adds homebrew openjdk install to path
path=("/opt/homebrew/opt/openjdk/bin" $path)

# QMK tab completion
# eval "$(register-python-argcomplete --no-defaults qmk)"

# GPG

export GPG_TTY=$(tty)
gpg-connect-agent /bye 2>/dev/null

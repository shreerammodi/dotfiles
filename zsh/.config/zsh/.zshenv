eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(gpg-connect-agent --quiet /bye)"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Typst ignores XDG on macOS by default (it uses ~/Library/Application Support
# and ~/Library/Caches). Point both at the XDG dirs: local @local/* packages
# resolve from XDG_DATA_HOME, downloaded packages cache under XDG_CACHE_HOME.
export TYPST_PACKAGE_PATH="$XDG_DATA_HOME/typst/packages"
export TYPST_PACKAGE_CACHE_PATH="$XDG_CACHE_HOME/typst/packages"

export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="bat"
export MANPAGER="nvim +Man!"
export KEYID="0x994DB28C8F367B2F"
export LEDGER_FILE="$HOME/Documents/src/github.com/shreerammodi/finances/hledger.journal"
export JAVA_HOME="/opt/homebrew/opt/openjdk/"
export PASSWORD_STORE_ENABLE_EXTENSIONS=true

source "$HOME/.env"

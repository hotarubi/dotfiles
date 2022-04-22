. ~/.zsh/config
. ~/.zsh/aliases
#. ~/.zsh/completion

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && . ~/.localrc

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
#[[ -f ~/.money-shell-announce.sh ]] && source ~/.money-shell-announce.sh
export PATH="/usr/local/homebrew/opt/postgresql@12/bin:$PATH"
export PKG_CONFIG_PATH="/usr/local/Homebrew/Cellar/imagemagick/7.1.0-10/lib/pkgconfig"
export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Install managers
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

#export NVM_DIR="$HOME/.nvm"
#[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
#[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
# END Install managers
export NODE_OPTIONS="--max-old-space-size=8192"


#export JAVA_HOME=/Users/frank.duan/.sdkman/candidates/java/8.0.422-amzn
export JAVA_HOME=/Users/frank.duan/Library/Java/JavaVirtualMachines/corretto-18.0.2/Contents/Home

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export KUBECONFIG="$HOME/.kube/ttd:$HOME/.kube/config"


source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

. ~/.zsh/aliases
. ~/.zsh/history

export PATH="$HOME/.local/bin:$PATH"

# TTD identifiers and secrets (from ttd-dotfiles)
[[ -f ~/.zsh/ttd-ids.zsh              ]] && source ~/.zsh/ttd-ids.zsh
[[ -f ~/.zsh/ttd-secrets.zsh          ]] && source ~/.zsh/ttd-secrets.zsh
[[ -f ~/.zsh/post-mr-push-wrapper.zsh ]] && source ~/.zsh/post-mr-push-wrapper.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

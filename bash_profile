export PATH=~/bin:$PATH

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

if [ -f ~/profile ]; then
  source ~/.profile
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

ifconfig | grep inet | grep 172.31 && source corp || source red

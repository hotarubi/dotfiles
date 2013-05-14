if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

# homebrew
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# mysql
export PATH="/usr/local/mysql/bin:$PATH"

# huggies
export PATH="~/Sites/huggies-init/bin:$PATH"

# 12wbt
export PATH="~/Sites/12wbt-init/bin:$PATH"

# Heroku Toolbelt (optional)
# you only need this one if you want to use the heroku toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="~/Sites/huggies-init/bin:$PATH"
export PATH="~/Sites/12wbt-init/bin:$PATH"

# http://robots.thoughtbot.com/post/27985816073/the-hitchhikers-guide-to-riding-a-mountain-lion
# this lets you compile mysql + mysql2 gems on mountain lion
export CPPFLAGS=-I/opt/X11/include

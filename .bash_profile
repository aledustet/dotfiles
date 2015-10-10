# Finished adapting your PATH environment variable for use with MacPorts.

# export MAGICK_HOME="$HOME/ImageMagick-6.8.6"

# export PATH="$MAGICK_HOME/bin:$PATH"

# export DYLD_LIBRARY_PATH="$MAGICK_HOME/lib/"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

alias l='ls -l'
alias la='l -a'

export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export PATH="/usr/local/heroku/bin:$PATH"

alias ls='ls -GFh'
alias ga='git aa'
alias gcm='git cm'
alias gacm='ga && gcm'
alias mer='git mer'
alias st='git st'
alias lg='git lg'
alias gco='git co'
alias gb='git branch'
alias gitdiscard='git stash save --keep-index && git stash drop'
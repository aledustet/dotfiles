export ZSH=/Users/dustet/.oh-my-zsh

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH=$PATH:$HOME/bin

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colored-man colorize github brew osx zsh-syntax-highlighting rvm rails git bundler gem git-extras git-flow history jsontools npm node)

# User configuration

export PATH=$PATH:"/usr/local/heroku/bin:/usr/local/heroku/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin"

source $ZSH/oh-my-zsh.sh
alias fix-test-db="bin/rails db:drop RAILS_ENV=test && bin/rails db:create RAILS_ENV=test && bin/rails db:environment:set RAILS_ENV=test && RAILS_ENV=test rails db:schema:load && rake parallel:prepare"
alias wipit="gaa && gcmsg 'WIP'"
alias un-wipit="git reset --soft HEAD\^ && git reset ."
alias rs="rails server thin -b 127.0.0.1"
alias rspuma="rails server -b 127.0.0.1"
alias prepare-test="bin/rails db:migrate && bin/rails db:environment:set RAILS_ENV=test && RAILS_ENV=test bin/rails db:schema:load && rake parallel:prepare"
alias super-migrate="rake db:migrate && rake db:rollback && rake db:migrate"
alias run_staging_migrations="heroku run rake db:migrate -a line5-staging && heroku restart -a line5-staging"
alias production_console="heroku run rails console -a line5-production"
alias migrate="bin/rails db:migrate && RAILS_ENV=test bin/rails db:migrate && rake parallel:prepare"
alias rollback="bin/rails db:rollback"
alias matser="master"

#source /Users/dustet/misc/zsh-git-prompt/zshrc.sh
#local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
#PROMPT='${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(git_super_status)'
#ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


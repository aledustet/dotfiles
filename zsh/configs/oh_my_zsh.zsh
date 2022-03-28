export ZSH=$HOME/.oh-my-zsh
export ZSH_CACHE_DIR=$HOME/.zsh

ZSH_THEME="robbyrussell"

export GPG_TTY=$(tty)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colorize github brew macos rvm rails git bundler gem git-extras
  git-flow history jsontools npm node yarn)

autoload -U zmv
# you don't need the following two now, but put them also in your .zshrc
alias zcp="zmv -C"
alias zln="zmv -L"

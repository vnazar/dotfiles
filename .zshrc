#!/bin/sh

###########################
# Exports
###########################
export LC_ALL=en_US.UTF-8
ezsh if equal unamexport LANG=en_US.UTF-8
case `uname` in
  Darwin)
    export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
  ;;
  Linux)
    export XDG_CACHE_HOME=$HOME/.cache
  ;;
esac

###########################
# Miniconda
###########################
case `uname` in
  Darwin)
    # using brew
    export PATH="/usr/local/miniconda3/bin:$PATH"
  ;;
  Linux)
    export PATH="$HOME/miniconda3/bin:$PATH"
  ;;
esac

###########################
# Load antibody plugins
###########################
export ZSH="$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh"
source ~/.zsh_plugins.sh
autoload -U compinit && compinit

###########################
# fnm
###########################
export PATH=$HOME/.fnm:$PATH
export PATH=$HOME/bin:$PATH
eval "`fnm env --multi`"

###########################
# ZSH 
###########################
export HISTSIZE=100000
export HISTFILESIZE=100000


###########################
# Aliases/Binds 
###########################
if [[ "$(uname)" == "Linux" ]]; then
    # bpcopy like as macos
    alias pbcopy='xclip -selection clipboard'
    alias pbpaste='xclip -selection clipboard -o'
fi
alias vim=nvim
alias vi=nvim
alias kp='f() { kill -9 $(lsof -ti tcp:$1) };f'
alias ts='date +%s'
alias o='xdg-open'
# Key bindings for forward/backward words
bindkey -e
bindkey '[C' forward-word
bindkey '[D' backward-word

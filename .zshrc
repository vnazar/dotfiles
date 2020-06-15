###########################
# exports
###########################
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
case `uname` in
  Darwin)
    export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
  ;;
  Linux)
    export XDG_CACHE_HOME=$HOME/.cache
  ;;
esac

###########################
# miniconda3
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
# antibody
###########################
export ZSH="$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh"
source ~/.zsh_plugins.sh
autoload -U compinit && compinit

###########################
# nvm
###########################
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

###########################
# zsh 
###########################
export HISTSIZE=100000
export HISTFILESIZE=100000

###########################
# fzf 
###########################
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

###########################
# autojump 
###########################
# TODO: Execute only with pamac installation. https://aur.archlinux.org/packages/autojump/
[[ -s /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh

###########################
# aliases/binds
###########################
if [[ "$(uname)" == "Linux" ]]; then
    # bpcopy like as macos
    alias pbcopy='xclip -selection clipboard'
    alias pbpaste='xclip -selection clipboard -o'
    alias o='xdg-open'
fi
alias vim=nvim
alias vi=nvim
alias kp='f() { kill -9 $(lsof -ti tcp:$1) };f'
alias ts='date +%s'
# Key bindings for forward/backward words
bindkey -e
bindkey '[C' forward-word
bindkey '[D' backward-word


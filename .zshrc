# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
export PATH="/usr/local/miniconda3/bin:$PATH"

ZSH="$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh"

# Load antibody plugins
source ~/.zsh_plugins.sh

autoload -Uz compinit
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi

# Key bindings for forward/backward words
bindkey -e
bindkey '[C' forward-word
bindkey '[D' backward-word

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# GoLang Config
export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

# Aliases
alias vim=nvim
alias vi=nvim
alias ssh-ec2=ssh-ec2
alias ts='date +%s'

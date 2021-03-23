######################
# Zinit installer
######################
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
# zinit light zinit-zsh/z-a-rust
# zinit light zinit-zsh/z-a-as-monitor
# zinit light zinit-zsh/z-a-patch-dl
# zinit light zinit-zsh/z-a-bin-gem-node

######################
# Theme
######################
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure 

######################
# Plugins
######################
# AUTOSUGGESTIONS, TRIGGER PRECMD HOOK UPON LOAD
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
zinit ice wait'0a' lucid atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions

# ZSH HISTORY SUBSTRING SEARCH
zinit ice wait'0a' lucid atload="bindkey '\eOA' history-substring-search-up;\
				bindkey '\eOB' history-substring-search-down;\
				HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=green,fg=white,bold';\
				HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=red,fg=white,bold'"
zinit light zsh-users/zsh-history-substring-search 

# ZSH COMPLETIONS
zstyle ':completion:*' menu select # select completions with arrow keys
zstyle ':completion:*' group-name '' # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored _approximate # enable approximate matches 
zinit ice wait'0a' lucid blockf atpull'zinit creinstall -q .'
zinit light zsh-users/zsh-completions

# SYNTAX HIGHLIGHTING
zinit ice wait'0b' lucid atinit"zpcompinit;zpcdreplay"
zinit light zdharma/fast-syntax-highlighting

# AUTOJUMP
zinit ice wait'0b' lucid
zinit snippet OMZP::autojump 

# GIT
zinit ice wait'0b' lucid
zinit snippet OMZP::git

# Docker
zinit ice wait as"completion" lucid
zinit snippet OMZP::docker/_docker

# NVM
zinit ice wait'1' lucid
zinit light lukechilds/zsh-nvm

######################
# History
######################
setopt share_history # Share history between tabs
setopt hist_ignore_all_dups # Remove older duplicate entries from history
setopt hist_reduce_blanks # Remove superfluous blanks from history items
setopt inc_append_history # Save history entries as soon as they are entered
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000

######################
# Env Vars
######################
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
case `uname` in
  Darwin)
  ;;
  Linux)
    export XDG_CACHE_HOME=$HOME/.cache
  ;;
esac

######################
# Aliases/Binds
######################
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
if [[ "$(uname)" == "Linux" ]]; then
    bindkey '^[[1;5C' forward-word
    bindkey '^[[1;5D' backward-word
else
    bindkey '[C' forward-word
    bindkey '[D' backward-word
fi

########################
# Pyenv
########################
export PATH="/home/vnazar/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


###########################
# Poetry
###########################
export PATH="$HOME/.poetry/bin:$PATH"

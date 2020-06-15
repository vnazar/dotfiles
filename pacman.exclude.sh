# update
sudo pacman -Syu && sudo pacman -Syy 

###########################
# Libraries
###########################

# build-essential libssl-dev
sudo pacman -Sy --noconfirm base-devel

###########################
# Tools
###########################
# zsh
sudo pacman -Sy --noconfirm zsh
chsh -s $(which zsh)

# antibody
pamac build antibody
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

# fzf
sudo pacman -Sy --noconfirm fzf

# autojump
pacman build autojump

# neovim
sudo pacman -Sy --noconfirm neovim
nvim +PlugInstall +qall > /dev/null # install plugins

###########################
# Environment Managers
###########################

# nvm
pamac build nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# miniconda
wget -O ~/miniconda.sh https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh && bash ~/miniconda.sh && rm ~/miniconda.sh

###########################
# Languages
###########################

# nodejs & npm
nvm install --lts --latest-npm

###########################
# Remove Packages
###########################
sudo pacman -R
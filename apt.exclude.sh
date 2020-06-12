# update
sudo apt update -y

###########################
# Libraries
###########################

# build-essential libssl-dev
sudo apt install build-essential libssl-dev -y

###########################
# Tools
###########################
# zsh
sudo apt install zsh
chsh -s $(which zsh)

# antibody
curl -sfL git.io/antibody | sudo sh -s - -b /usr/local/bin
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

# fzf
sudo apt install fzf -y

# autojump
sudo apt install autojump -y

# neovim
sudo apt install neovim -y

###########################
# Environment Managers
###########################

# nvm
wget -O - https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
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
sudo apt autoremove
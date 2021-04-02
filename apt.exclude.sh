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
# curl
sudo apt install curl

# zsh
sudo apt install zsh
chsh -s $(which zsh)

# fzf
sudo apt install fzf -y

# autojump
sudo apt install autojump -y

# neovim
sudo apt install neovim -y
nvim +PlugInstall +qall > /dev/null # install plugins

# nvm
wget -O - https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


###########################
# Remove dependencies
sudo apt autoremove

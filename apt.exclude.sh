sudo apt update -y

sudo apt -y install \
	make \
	build-essential \
	libssl-dev \
	zlib1g-dev 
	libbz2-dev 
	libreadline-dev 
	libsqlite3-dev \
	wget \
	curl \
	llvm \
	libncurses5-dev \
	xz-utils \
	tk-dev \
	libxml2-dev \
	libxmlsec1-dev \
	libffi-dev \
	liblzma-dev \

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

# nvm
wget -O - https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
nvm install --lts # Install last Node LTS version

# Pyenv
curl https://pyenv.run | bash

# neovim
sudo apt install neovim -y
nvim +PlugInstall +qall > /dev/null # install plugins

###########################
# Remove dependencies
sudo apt autoremove

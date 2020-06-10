# update
apt-get update -y

# build-essential libssl-dev
apt-get install build-essential libssl-dev -y

# antibody
curl -sfL git.io/antibody | sh -s - -b /usr/local/bin

# fzf
apt-get install fzf -y || git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install 

# autojump
apt-get install autojump -y

# nvm
wget -O - https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

# miniconda
wget -O ~/miniconda.sh https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh && bash ~/miniconda.sh && rm ~/miniconda.sh

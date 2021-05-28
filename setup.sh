#!/bin/bash -x

sudo apt update && sudo apt upgrade
# General packages
sudo apt install curl wget git stow tree dconf-editor unzip software-properties-common apt-transport-https
# Node with Nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
nvm install --lts
# Zsh and Oh-my-zsh
sudo apt-get install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
chsh -s `which zsh`
# Docker 
# https://docs.docker.com/engine/install/ubuntu/
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo docker run hello-world
sudo usermod -aG docker ${USER}
su - ${USER}
# Php
sudo apt install 
sudo add-apt-repository ppa:ondrej/php
sudo apt install php7.1 php7.1-fpm php7.1-cli php7.1-zip php7.1-xml php7.1-soap php7.1-amqp php7.1-curl php7.1-mbstring php7.1-mysql
# Composer
wget -O composer-setup.php https://getcomposer.org/installer
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
### GCP 
# Kubernetes
sudo snap install kubectl --classic
# Gcloud
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt-get update && sudo apt-get install google-cloud-sdk
gcloud init
gcloud container clusters get-credentials med360-app-cluster --zone us-central1-a --project med360-207318

### get main apps
# Vscode
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code
# Tilix (terminal emulator)
sudo add-apt-repository ppa:ubuntuhandbook1/tilix
sudo apt install tilix
sudo ln -s /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh
# Chrome
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt update
sudo apt install google-chrome-stable
sudo rm /etc/apt/sources.list.d/google-chrome.list
### Snaps
# Spotify
sudo snap install spotify
# Simplenote
sudo snap install simplenote
# Dbeaver
sudo snap install dbeaver-ce
# Slack
sudo snap install slack --classic
# Flameshot
sudo snap install flameshot
# Postman
sudo snap install postman

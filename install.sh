#!/usr/bin/env bash

#https://askubuntu.com/questions/79280/how-to-install-chrome-browser-properly-via-command-line
#Chrome
sudo apt-get install libxss1 libappindicator1 libindicator7 -y
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome*.deb
sudo apt-get install -f

#Visual Code
#https://code.visualstudio.com/docs/setup/linux
#https://code.visualstudio.com/docs/getstarted/settings
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get update -y
sudo apt-get install code -y

# Intellij
# http://ubuntuhandbook.org/index.php/2017/07/intellij-idea-2017-2-released-how-to-install-in-ubuntu/
sudo add-apt-repository ppa:ubuntuhandbook1/apps
sudo apt-get update
sudo apt-get install intellij-idea-community

# Git
apt-get install git
git config --global user.email "porcelani@gmail.com"
git config --global user.name "Porcelani"
git config --global http.sslverify false

#SVN
sudo apt install subversion -y

#Docker
#https://gist.github.com/wdullaer/f1af16bd7e970389bad3
wget -qO- https://get.docker.com/ | sh
##Docker-compose
COMPOSE_VERSION=`git ls-remote https://github.com/docker/compose | grep refs/tags | grep -oP "[0-9]+\.[0-9][0-9]+\.[0-9]+$" | tail -n 1`
sudo sh -c "curl -L https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose"
sudo chmod +x /usr/local/bin/docker-compose
sudo sh -c "curl -L https://raw.githubusercontent.com/docker/compose/${COMPOSE_VERSION}/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose"
sudo gpasswd -a ${USER} docker
sudo service docker restart

#Java Ecosystem
#https://sdkman.io/install
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

#Node
#https://github.com/creationix/nvm
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
nvm install --lts


#CopyQ
#Config: Preferences > Shoutcuts > Show/Hide main Window > Global Shoutcut 
sudo add-apt-repository ppa:noobslab/indicators -y
sudo apt-get update
sudo apt-get install copyq -y

#PrintScreen - Shutter
# http://askubuntu.com/questions/456985/how-to-change-the-keyboard-shortcut-to-take-screenshots-with-shutter
sudo apt-get install shutter -y

#Guake(Terminal)
#Config: https://askubuntu.com/questions/136559/guake-doesnt-start-when-session-starts
sudo apt-get install guake -y

#DBeaver
# https://dbeaver.io/download/
sudo add-apt-repository ppa:serge-rider/dbeaver-ce
sudo apt-get update
sudo apt-get install dbeaver-ce


#Sexy-bash
(cd /tmp && git clone --depth 1 --config core.autocrlf=false https://github.com/twolfson/sexy-bash-prompt && cd sexy-bash-prompt && make install) && source ~/.bashrc

#suporte 32bits
sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 libxrender1:i386 libxtst6:i386 libxi6:i386

#Kitematic
docker run --net host --name kitematic \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-e DISPLAY=$DISPLAY \
-v $HOME/.Xauthority:/root/.Xauthority \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v /var/run/docker.sock:/var/run/docker.sock \
--privileged=true -t jonadev95/kitematic-docker
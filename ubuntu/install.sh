#!/usr/bin/env bash
sudo su -

#Java
add-apt-repository ppa:webupd8team/java -y
apt-get update
apt-get install oracle-java8-installer
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections

#Maven
apt-get install maven -y

#Git
apt-get install git
git config --global user.email "porcelani@gmail.com"
git config --global user.name "Porcelani"
git config --global http.sslverify false

#SVN
apt install subversion

#Guake(Terminal)
apt-get install guake -y

#Atom
add-apt-repository ppa:webupd8team/atom -y
apt-get update
apt-get install atom -y

#CopyQ
add-apt-repository ppa:noobslab/indicators -y
apt-get update
apt-get install copyq -y

#PrintScreen - Shutter
# http://askubuntu.com/questions/456985/how-to-change-the-keyboard-shortcut-to-take-screenshots-with-shutter
apt-get install shutter -y

#Node
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
apt-get install -y nodejs
apt-get install -y build-essential

#Docker
#https://gist.github.com/wdullaer/f1af16bd7e970389bad3
wget -qO- https://get.docker.com/ | sh

#Docker-compose
COMPOSE_VERSION=`git ls-remote https://github.com/docker/compose | grep refs/tags | grep -oP "[0-9]+\.[0-9][0-9]+\.[0-9]+$" | tail -n 1`
sudo sh -c "curl -L https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose"
sudo chmod +x /usr/local/bin/docker-compose
sudo sh -c "curl -L https://raw.githubusercontent.com/docker/compose/${COMPOSE_VERSION}/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose"

sudo gpasswd -a ${USER} docker
sudo service docker restart

#Kitematic
docker run --net host --name kitematic \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-e DISPLAY=$DISPLAY \
-v $HOME/.Xauthority:/root/.Xauthority \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v /var/run/docker.sock:/var/run/docker.sock \
--privileged=true -t jonadev95/kitematic-docker


#downloads
curl http://cdn01.downloads.smartbear.com/soapui/5.3.0/SoapUI-x64-5.3.0.sh -o /opt/SoapUI.sh

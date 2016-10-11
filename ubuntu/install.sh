sudo su -

#Java
add-apt-repository ppa:webupd8team/java -y
apt-get update
apt-get install oracle-java8-installer
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections

#Git
apt-get install git
git config --global user.email "porcelani@gmail.com"
git config --global user.name "Porcelani"

#Terminator
add-apt-repository ppa:gnome-terminator -y
apt-get update
apt-get install terminator

#Atom
add-apt-repository ppa:webupd8team/atom -y
apt-get update
apt-get install atom

#CopyQ
add-apt-repository ppa:noobslab/indicators -y
apt-get update
apt-get install copyq

#Paint
apt-get install kolourpaint4 -y

#PrintScreen
apt-get install shutter -y

#Node
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
apt-get install -y nodejs
apt-get install -y build-essential

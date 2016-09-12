sudo su -

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

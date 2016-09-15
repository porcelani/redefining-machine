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

#CopyQ
add-apt-repository ppa:noobslab/indicators -y
apt-get update
apt-get install copyq

#Paint
apt-get install kolourpaint4 -y

#PrintScreen
apt-get install shutter -y

#Foxit
# wget http://cdn01.foxitsoftware.com/pub/foxit/reader/desktop/linux/2.x/2.1/en_us/FoxitReader2.1.0805_Server_x64_enu_Setup.run.tar.gz
# tar xzvf FoxitReader*.tar.gz
# chmod a+x FoxitReader*.run
# ./FoxitReader.*.run

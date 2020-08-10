#!/usr/bin/env bash

sudo apt-get update

echo 'installing tools' 
sudo apt install curl -y
sudo apt install jq -y
sudo apt install vim -y
sudo apt-get install xclip -y
sudo apt-get install awscli -y
sudo apt-get install -y libssl-dev libreadline-dev zlib1g-dev

echo 'installing git' 
sudo apt install git -y
git config --global user.email "porcelani@gmail.com"
git config --global user.name "Porcelani"
git config --global core.editor vim

echo "Generating a SSH Key"
ssh-keygen -t rsa -b 4096 -C $git_config_user_email
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub | xclip -selection clipboard


echo 'installing zsh'
#https://medium.com/@ivanaugustobd/seu-terminal-pode-ser-muito-muito-mais-produtivo-3159c8ef77b2
sudo apt-get install zsh -y
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
chsh -s /bin/zsh

echo 'installing plugins' 
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
source ~/.zshrc

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting 
echo "source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
source ~/.zshrc

echo 'installing vim plugins'
#https://medium.com/@huntie/10-essential-vim-plugins-for-2018-39957190b7a9
#https://github.com/junegunn/vim-plug
#vim ~/.vimrc
#:PlugInstall
cat <<EOT >> ~/.vimrc
call plug#begin('~/.vim/plugged')

set number

Plug 'airblade/vim-gitgutter'
set updatetime=250
highlight GitGutterAdd guifg=#009900 ctermfg=Green
highlight GitGutterChange guifg=#bbbb00 ctermfg=Yellow
highlight GitGutterDelete guifg=#ff2222 ctermfg=Red
nmap ) <Plug>(GitGutterNextHunk)
nmap ( <Plug>(GitGutterPrevHunk)
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0

Plug 'doums/darcula'
Plug 'editorconfig/editorconfig-vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'

call plug#end()

set termguicolors
colorscheme darcula
EOT

echo 'installing asdf'
#https://asdf-vm.com/#/core-manage-asdf-vm
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.8
echo ". $HOME/.asdf/asdf.sh" >> ~/.zshrc # or add asdf as a pluging EX: plugins=(git asdf)
source ~/.zshrc

#https://dancroak.com/asdf-version-manager
asdf_plugin_update() {
  if ! asdf plugin-list | grep -Fq "$1"; then
    asdf plugin-add "$1" "$2"
  fi
  asdf plugin-update "$1"
}

asdf_plugin_update "nodejs" "https://github.com/asdf-vm/asdf-nodejs"
export NODEJS_CHECK_SIGNATURES=no
asdf install nodejs 13.7.0
echo "nodejs 13.7.0" >> ~/.tool-versions

asdf_plugin_update "ruby" "https://github.com/asdf-vm/asdf-ruby"
asdf install ruby 2.5.1
echo "ruby 2.5.1" >> ~/.tool-versions

asdf_plugin_update "java" "https://github.com/halcyon/asdf-java.git"
asdf install java adopt-openjdk-11.0.7+10
echo "java adopt-openjdk-11.0.7+10" >> ~/.tool-versions

asdf_plugin_update "sbt"
asdf install sbt 1.1.1
echo "sbt 1.1.1" >> ~/.tool-versions

asdf_plugin_update "scala" "https://github.com/mtatheonly/asdf-scala"
asdf install scala 2.12.10
echo "scala 2.12.10" >> ~/.tool-versions

echo 'installing fzf'
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

echo 'installing terminator'
sudo apt-get install terminator -y

echo 'installing Guake'
#Config: https://askubuntu.com/questions/136559/guake-doesnt-start-when-session-starts
sudo apt-get install guake -y


echo 'installing code'
#https://code.visualstudio.com/docs/setup/linux
#https://code.visualstudio.com/docs/getstarted/settings
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get install apt-transport-https -y
sudo apt-get update
sudo apt-get install code -y # or code-insiderssudo apt-get install xclip -y

echo 'installing extensions'
code --install-extension Shan.code-settings-sync


echo 'installing docker' 
sudo apt-get remove docker docker-engine docker.io
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
docker --version
chmod 777 /var/run/docker.sock
sudo usermod -aG docker $USER
sudo groupadd docker
newgrp docker
docker run hello-world

echo 'installing docker-compose' 
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version


echo 'installing CopyQ'
#Config: Preferences > Shoutcuts > Show/Hide main Window > Global Shoutcut 
sudo add-apt-repository ppa:noobslab/indicators -y
sudo apt-get update
sudo apt-get install copyq -y

echo 'installing Shutter'
# http://askubuntu.com/questions/456985/how-to-change-the-keyboard-shortcut-to-take-screenshots-with-shutter
sudo add-apt-repository -y ppa:linuxuprising/shutter
sudo apt-get update
sudo apt-get install shutter -y

echo 'installing DBeaver'
# https://dbeaver.io/download/
sudo add-apt-repository ppa:serge-rider/dbeaver-ce
sudo apt-get update
sudo apt-get install dbeaver-ce

echo 'installing chrome' 
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

echo 'installing slack' 
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-3.3.8-amd64.deb
sudo apt install ./slack-desktop-*.deb -y

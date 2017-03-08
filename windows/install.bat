
REM Install Package Manager as a Admin
@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

choco install googlechrome -y
choco install googledrive -y
choco install googlephotos -y
choco install ditto -y
choco install foxitreader -y
choco install 7zip.install -y
choco install notepadplusplus.install -y
choco install atom -y
choco install git -y
git config --global user.email "porcelani@gmail.com"
git config --global user.name "porcelani"
choco install wget -y
choco install vim -y
choco install jdk8 -y
choco install nodejs.install -y
npm install -g lite-server
npm install -g webpack
choco install intellijidea-ultimate -y
choco install putty.install -y
choco install mtputty -y --allow-empty-checksums
choco install docker -y
choco install maven -y
choco install libreoffice -y
choco install github -y --ignore-checksums
choco install prtscr -y

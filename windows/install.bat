#Install Package Manager as a Admin
@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"


choco install googlechrome -y
choco install googledrive -y
choco install googlephotos -y
choco install spotify -y
choco install ditto -y

choco install 7zip.install -y
choco install notepadplusplus.install -y
choco install atom -y
choco install git -y
choco install github -y
choco install jdk8 -y
choco install nodejs.install -y
choco install intellijidea-ultimate -y
choco install putty.install -y

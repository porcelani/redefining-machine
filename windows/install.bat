#Install Package Manager as a Admin
@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"


choco install googlechrome -y
choco install ditto -y

choco install jdk8 -y
choco install nodejs.install -y
choco install intellijidea-ultimate -y
choco install putty.install -y

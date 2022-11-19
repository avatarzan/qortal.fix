#!/bin/sh

# Regular Colors
BLACK='\033[0;30m'        # Black
RED='\033[0;31m'          # Red
GREEN='\033[0;32m'        # Green
YELLOW='\033[0;33m'       # Yellow
BLUE='\033[0;34m'         # Blue
PURPLE='\033[0;35m'       # Purple
CYAN='\033[0;36m'         # Cyan
WHITE='\033[0;37m'        # White
NC='\033[0m'              # No Color

echo "${PURPLE} UPDATING UBUNTU AND INSTALLING REQUIRED SOFTWARE PACKAGES ${NC}\n" 

sudo apt update 
sudo apt -y upgrade
sudo apt -y install unzip vim curl default-jre cinnamon-desktop-environment vlc chromium-browser p7zip-full libfuse2 htop

echo "${BLUE} DOWNLOADING QORTAL CORE AND QORT SCRIPT ${NC}\n"

curl -L -O https://github.com/Qortal/qortal/releases/latest/download/qortal.zip
unzip qortal*.zip
rm qortal*.zip
cd qortal
chmod +x *.sh
curl -L -O https://raw.githubusercontent.com/Qortal/qortal/master/tools/qort
chmod +x qort


echo "${PURPLE} DOWNLOADING QORTAL UI AppImage AND RENAMING ${NC}\n"

cd 
cd Desktop
curl -L -O https://github.com/Qortal/qortal-ui/releases/latest/download/Qortal-Setup-amd64.AppImage
mv Qortal-Setup*.AppImage Qortal-UI
chmod +x Qortal-UI

echo "${CYAN} DOWNLOADING PICTURE FILES AND OTHER SCRIPTS ${NC}\n"

cd

curl -L -O https://cloud.qortal.org/s/t4Fy8Lp4kQYiYZN/download/Machine-files.zip
curl -L -O https://raw.githubusercontent.com/crowetic/QORTector-scripts/main/refresh-qortal.sh
curl -L -O https://raw.githubusercontent.com/crowetic/QORTector-scripts/main/auto-fix-qortal.sh
curl -L -O https://raw.githubusercontent.com/crowetic/QORTector-scripts/main/check-qortal-status.sh

chmod +x *.sh
mv check-qortal-status.sh ~/Desktop

unzip Machine-files.zip

mv Machine-files/Pictures/*.* ~/Pictures/
mv Machine-files/start-qortal.sh ~/

curl -L -O https://cloud.qortal.org/s/8z4sRiwJCPqM4Fi/download/Qortal-TheFuture-Wallpaper.png
mv Qortal-The*.png ~/Pictures/


curl -L -O https://cloud.qortal.org/s/6d8qoEkQRDSCTqn/download/rebuilt-machine-setup.txt
mv rebuilt-machine-setup.txt ~/Desktop


echo "${YELLOW} FINISHING UP ${NC}\n"

chmod +x *.sh

curl -L -O https://raw.githubusercontent.com/crowetic/QORTector-scripts/main/rebuilt-machine-cron
crontab rebuilt-machine-cron

rm -R Machine-files
rm Machine-files.zip

echo "${CYAN} REBOOTING MACHINE - USE CINNAMON DESKTOP ENVIRONMENT UPON REBOOT BY CLICKING LOGIN NAME THEN SETTINGS ICON AT BOTTOM RIGHT, AND CHANGING TO CINNAMON ${NC}\n" 

sudo reboot



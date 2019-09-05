#!/bin/bash
sudo apt-get update -y
sudo apt install nodejs -y
sudo apt install npm -y

sudo npm install -g npm@latest
sudo npm install -g n
sudo n latest

sudo -s npm install -g @angular/cli

sudo apt install  git
sudo git  clone  https://github.com/genomesmart/genomesmart-UI.git
sudo git branch
sudo git fetch --all
sudo git checkout insance/dev

cd genomesmart-UI
sudo -s npm i 
exit
sudo ng build --configuration=dev
sudo ng serve

#node --max_old_space_size=2048 node_modules/@angular/cli/bin/ng build --configuration=dev

sudo npm install --unsafe-perm
sudo -s npm i
sudo ng build --configuration=dev

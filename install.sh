#!/bin/bash

sudo apt-get install software-properties-common # needed for adding keys?

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

sudo add-apt-repository ppa:mythbuntu/0.28
sudo add-apt-repository ppa:heyarje/makemkv-beta

sudo apt-get update 
sudo apt-get install google-chrome-stable mythtv kodi kodi-pvr-mythtv

sudo apt-mark hold libaacs0
cd /usr/lib
sudo ln -s libmmbd.so.0 libaacs.so.0
sudo ln -s libmmbd.so.0 libbdplus.so.0

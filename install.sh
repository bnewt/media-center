#!/bin/bash

sudo apt-get install software-properties-common # needed for adding keys?

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

sudo add-apt-repository ppa:mythbuntu/0.28
sudo add-apt-repository ppa:heyarje/makemkv-beta
sudo add-apt-repository ppa:team-xbmc/ppa

sudo apt-get update 
sudo apt-get install google-chrome-stable mythtv kodi kodi-pvr-mythtv makemkv-bin makemkv-oss

sudo apt-mark hold libaacs0
cd /usr/lib
sudo rm libaacs.so* libbdplus.so*
sudo ln -s libmmbd.so.0 libaacs.so.0
sudo ln -s libmmbd.so.0 libbdplus.so.0

cd /usr/lib/x86_64-linux-gnu/
sudo rm libaacs.so* libbdplus.so*
sudo ln -s /usr/lib/libmmbd.so.0 libaacs.so.0
sudo ln -s /usr/lib/libmmbd.so.0 libbdplus.so.0

echo 'fix up mysql user permissions/password for mythtv'
echo 'do mythtvbackend setup (file permissions are important so that the user the backend runs as can write to the recording directory)'
echo 'make sure to set screensaver to not lock the computer and set wake from sleep on keyboard'

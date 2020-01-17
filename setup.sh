#!/bin/bash
cd ~ || exit
ln -s ~/Documents/dotfiles/.vim .vim
ln -s ~/Documents/dotfiles/.vimrc .vimrc
ln -s ~/Documents/dotfiles/.bash_profile .bash_profile
ln -s ~/Documents/dotfiles/.bashrc .bashrc
ln -s ~/Documents/dotfiles/Programs Programs
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl

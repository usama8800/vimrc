#!/bin/bash

echo "The dotfiles directory should be in ~/Documents/"
echo "Continue? (y/n)"
while read yes; do
	if [ "$yes" == "y" ]; then
		cd ~ || exit
		ln -s ~/Documents/dotfiles/.vim .vim
		ln -s ~/Documents/dotfiles/.vimrc .vimrc
		ln -s ~/Documents/dotfiles/.bash_profile .bash_profile
		ln -s ~/Documents/dotfiles/.bashrc .bashrc
		ln -s ~/Documents/dotfiles/Programs Programs
		echo -e "\nDownloading youtube downloader"
		sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl && sudo chmod a+rx /usr/local/bin/youtube-dl
		break
	elif [ "$yes" == "n" ]; then
		break
	fi
	echo "Continue? (y/n)"
done

#!/bin/bash

# Must use "$ bash install.sh" or "$ ./install.sh" to replace configs

configs=(".gitconfig" ".vimrc" ".tmux.conf" ".bashrc" ".Xresources")

# Get project path
PWD="$(pwd)"
#echo $PWD

for i in "${configs[@]}"
do
	#echo $i
	# create a symbolic link to my config and backup current config
	ln --backup=numbered -s $PWD/$i ~/$i
done

# =========================
# upgrade linux distribution
# =========================

# https://linuxconfig.org/how-to-upgrade-to-ubuntu-18-04-lts-bionic-beaver
# let system up-to-date
sudo apt update
sudo apt upgrade
sudo apt dist-upgrade
sudo apt autoremove

# =========================
# install tools 
# =========================

# checkinstall: https://www.ptt.cc/bbs/Linux/M.1497723043.A.002.html
sudo apt install git vim tmux curl gcin automake pkg-config gufw

mkdir tools

# universal ctags
# https://askubuntu.com/questions/796408/installing-and-using-universal-ctags-instead-of-exuberant-ctags
mkdir tools/ctags
git clone https://github.com/universal-ctags/ctags.git tools/ctags
cd tools/ctags
./autogen.sh 
./configure
make
sudo checkinstall make install


# install vim plugin manager
# do :PlugInstall in vim after installed
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

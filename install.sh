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

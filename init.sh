#!/bin/bash

VIM_PATH=$HOME/.vim/

# Install libraries
setupLibs() {
	sudo apt-get update &&
	sudo apt-get install -y vim \
												  git \
												  tmux \
												  openvpn \
												  openssh-server \
												  task \
												  cmake \
												  curl \
												  keepass2 \
												  xdotool \
												  xclip \
												  python-gpgme \
												  gnome-disk-utility \
												  usb-creator-kde
}

setupVim() {
	# create vim paths
	mkdir -p $VIM_PATH/autoload \
					 $VIM_PATH/bundle \
					 $VIM_PATH/snippets \
					 $HOME/vimBackups
					 
	# ------ PULL VIM REPOS -------
	# Pathogen
	curl -LSso $VIM_PATH/autoload/pathogen.vim https://tpo.pe/pathogen.vim
	sleep 1
	
	# NerdTree
	git clone https://github.com/scrooloose/nerdtree.git $VIM_PATH/bundle/nerdtree.vim
	sleep 1
	
	# SnipMate
	git clone https://github.com/tomtom/tlib_vim.git $VIM_PATH/bundle/tlib_vim
	git clone https://github.com/MarcWeber/vim-addon-mw-utils.git $VIM_PATH/bundle/vim-addon-mw-utils
	git clone https://github.com/garbas/vim-snipmate.git $VIM_PATH/bundle/vim-snipmate
	sleep 2
	
	# CtrlP
	git clone https://github.com/kien/ctrlp.vim.git $VIM_PATH/bundle/ctrlp.vim
	sleep 1
	
	# CtrlSF
	git clone https://github.com/dyng/ctrlsf.vim.git $VIM_PATH/bundle/ctrlsf.vim
	sleep 1
}

installTask() {
	git clone https://git.tasktools.org/scm/ex/tasksh.git $HOME/Downloads/tasksh
	
	sleep 1
	
	cd $HOME/Downloads/tasksh
	cmake .
	
	sleep 1
	
	make
	sudo make install
}

dotfilesConfig() {
	git clone git@github.com:completit/dotfiles.git $HOME/Downloads
	
	for i in $( $HOME/Downloads/dotfiles ); do
		
	done
}

$@
#!/bin/bash

VIM_PATH=$HOME/.vim/
DOTFILES_PATH=$HOME/dotfiles

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
												  usb-creator-kde \
                          unrar \
                          postgresql \
                          postgresql-contrib
}

setupVim() {
	# create vim paths
	mkdir -p $VIM_PATH/autoload \
					 $VIM_PATH/bundle \
					 $VIM_PATH/snippets \
					 $HOME/vimBackups
					 
	# ------ PULL VIM PLUGINS -------
	# Pathogen
	curl -LSso $VIM_PATH/autoload/pathogen.vim https://tpo.pe/pathogen.vim
	
	# NerdTree
	git clone https://github.com/scrooloose/nerdtree.git $VIM_PATH/bundle/nerdtree.vim
	
	# SnipMate
	git clone https://github.com/tomtom/tlib_vim.git $VIM_PATH/bundle/tlib_vim
	git clone https://github.com/MarcWeber/vim-addon-mw-utils.git $VIM_PATH/bundle/vim-addon-mw-utils
	git clone https://github.com/garbas/vim-snipmate.git $VIM_PATH/bundle/vim-snipmate
	
	# CtrlP
	git clone https://github.com/kien/ctrlp.vim.git $VIM_PATH/bundle/ctrlp.vim
	
	# CtrlSF
	git clone https://github.com/dyng/ctrlsf.vim.git $VIM_PATH/bundle/ctrlsf.vim
}

installTask() {
	git clone https://git.tasktools.org/scm/ex/tasksh.git $HOME/tasksh
	
	cd $HOME/tasksh
	cmake .
	
	make
	sudo make install
  
  cd
}

dotfilesConfig() {
	git clone git@github.com:completit/dotfiles.git $DOTFILES_PATH
  
  cp -f $DOTFILES_PATH/.vimrc \
     $DOTFILES_PATH/.bashrc \
     $DOTFILES_PATH/.tmux.conf \
     $DOTFILES_PATH/.taskrc \
     $DOTFILES_PATH/.bash_aliases \
     $DOTFILES_PATH/.gemrc $HOME/

  cp -R $DOTFILES_PATH/snippets/* $HOME/.vim/snippets/
}

setupRvm() {
  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

  curl -sSL https://get.rvm.io | bash -s stable --ruby=2.2

  # use ruby-2.2 with a gemset of rails-4.2
  `rvm use ruby-2.2.1@rails424 --create do gem install rails -v 4.2.4`
}

cleanBullshit() {
  rm -rf $HOME/dotfiles \
         $HOME/tasksh

}

# main command to put the system up
powerOn() {
  setupLibs
  setupVim
  installTask
  dotfilesConfig
  setupRvm
  cleanBullshit
}

$@

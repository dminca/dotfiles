#!/bin/bash
# Script that sets up the developer environment
# Copyright (C) 2015 Minca Daniel Andrei - All Rights Reserved
# Permission to copy and modify is granted under the GPL V2 license
# Last revised 14/11/2015

VIM_PATH=$HOME/.vim/
DOTFILES_PATH=$HOME/dotfiles

# Install libraries
setupLibs() {
  sudo add-apt-repository ppa:webupd8team/java
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
                          postgresql-contrib \
                          nodejs \
                          npm \
                          tree \
                          oracle-java8-installer \
                          oracle-java8-set-default \
                          sublime-text=3065
}

# --------- Helper Functions ------------
xitsts() {
  "$@"

  local status=$?

  if [ $status -ne 0 ]; then
    echo "Error: exited with status code $1" >&2
  fi

  return $status
}

breakline() {
  TXT="----| ${1} |----"
  TXT_LENGTH=$(expr length "${TXT}")
  NL=$'\n'
  DRAW_LINE=$(repeatChar $TXT_LENGTH "--")
  echo "${DRAW_LINE}${NL}${TXT}${NL}${DRAW_LINE}"
  echo ""
}
# ---- end helper func.

# setup docker
setupDocker() {

	breakline "Setup Docker"
		
	# Install  docker
	curl -sSL https://get.docker.com/ | sh
	sudo usermod -aG docker $USER


	# Install docker-compose
	sudo chown -R $(whoami) /usr/local/bin
	curl -L https://github.com/docker/compose/releases/download/1.4.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
	chmod +x /usr/local/bin/docker-compose

}

setupVim() {
  breakline "Create vim paths"

	mkdir -p $VIM_PATH/autoload \
					 $VIM_PATH/bundle \
					 $VIM_PATH/snippets \
					 $HOME/vimBackups
					 
  breakline "Pull VIM repositories"

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
  breakline "Install tasksh by taskwarrior"

  wget http://taskwarrior.org/download/tasksh-latest.tar.gz --directory-prefix=$HOME/Downloads
  
  tar xvf tasksh-latest.tar.gz

  cd tasksh-*

  cmake -DCMAKE_BUILD_TYPE=release .

  sleep 2

  make

  xitsts sudo make install
}

dotfilesConfig() {
  breakline "Cloning and copying dotfiles"

	git clone git@github.com:dminca/dotfiles.git $DOTFILES_PATH
  
  cp -f $DOTFILES_PATH/.vimrc \
     $DOTFILES_PATH/.bashrc \
     $DOTFILES_PATH/.tmux.conf \
     $DOTFILES_PATH/.taskrc \
     $DOTFILES_PATH/.bash_aliases \
     $DOTFILES_PATH/.gemrc $HOME/

  cp -R $DOTFILES_PATH/snippets/* $HOME/.vim/snippets/
  cp $DOTFILES_PATH/.tmux.conf $DOTFILES_PATH/shells/.vimrc $DOTFILES_PATH/shells/.taskrc $HOME/
}

setupRvm() {
  breakline "Install RVM"

  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

  curl -sSL https://get.rvm.io | bash -s stable --ruby=2.2

  # use ruby-2.2 with a gemset of rails-4.2
  rvm use ruby-2.2.1@rails424 --create
}

cleanBullshit() {
  breakline "Cleaning after installation"
  rm -rf $HOME/dotfiles \
         $HOME/Downloads/tasksh-*

}

# main command to put the system up
init() {
  setupLibs
  setupVim
  installTask
  dotfilesConfig
  setupDocker
  setupRvm
  cleanBullshit
}

"$@"

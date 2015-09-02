# Daniels Personal System Build instructions
>
Just a simple repo with Ubuntu building instructions for a humble devel.
>

### Aptitude packages
```
sudo apt-get update && sudo apt-get install -y git \
                                              tmux \
                                              vim \
                                              openvpn \
                                              openssh-server \
                                              task \
                                              cmake \
                                              curl \
                                              keepass2 \
                                              xdotool \
                                              python-gpgme
```

### tasksh (taskwarrior shell)
```
git clone https://git.tasktools.org/scm/ex/tasksh.git && 
cd tasksh && cmake -DCMAKE_BUILD_TYPE=release && 
make && 
sudo make install
```
### prepare vundle for vim
```
mkdir -p ~/.vim/autoload ~/.vim/bundle && 
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
```
>
The arguments ``-LSso`` are translated into:
* L, --location      Follow redirects (H)
* S, --show-error    Show error. With -s, make curl show errors when they occur
* s, --silent        Silent mode. Don't output anything
* o, --output FILE   Write output to <file> instead of stdout
>

### nerdtree with vundle
``cd ~/.vim/bundle && git clone https://github.com/scrooloose/nerdtree.git``

Then reload vim, run ``:Helptags``, and check out ``:help NERD_tree.txt``.

### SnipMate for vim
```
cd ~/.vim/bundle && 
git clone https://github.com/tomtom/tlib_vim.git && 
git clone https://github.com/MarcWeber/vim-addon-mw-utils.git && 
git clone https://github.com/garbas/vim-snipmate.git && 
mkdir -v ~/.vim/snippets && 
cd ~/.vim/snippets
```

### bashrc
```
git clone https://github.com/completit/dotfiles.git ~/Downloads &&
cd ~/Downloads/dotfiles && 
cp -v .vimrc .tmux.conf .bashrc .bash_aliases ~/
```

#### In case your drunk and forget how to configure vim-snippets or any other tools
Useful links and tuts:
* [Vim Essential Plugin: SnipMate - Tuts+ Code Tutorial](http://code.tutsplus.com/tutorials/vim-essential-plugin-snipmate--net-19356)

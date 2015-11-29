# Daniels Personal System Build instructions
[![Flattr this git repo](http://api.flattr.com/button/flattr-badge-large.png)](https://flattr.com/submit/auto?user_id=dminca&url=github.com/dminca/dotfiles&title=dotfiles&language=shell&tags=github&category=software)
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
Download the latest archive from the [official repo](https://git.tasktools.org/projects/EX/repos/tasksh) or just download the [tarball](http://taskwarrior.org/download/tasksh-latest.tar.gz)
```
$ ls
task-2.5.0.tar.gz
$ tar xzvf task-2.5.0.tar.gz
$ cd task-2.5.0
$ cmake -DCMAKE_BUILD_TYPE=release .
...
$ make
...
$ sudo make install
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

### Install CtrlP for vim

```
cd ~/.vim &&
git clone https://github.com/kien/ctrlp.vim.git bundle/ctrlp.vim
```

### bashrc
```
git clone https://github.com/completit/dotfiles.git ~/Downloads &&
cd ~/Downloads/dotfiles && 
cp -v .vimrc .tmux.conf .bashrc .bash_aliases ~/
```

### Configure vim backups and zsh plugins
```
mkdir ~/vimBackups/ &&
rm -v ~/.oh-my-zsh/custom ~/.vim/snippets &&
cp -vr ~/Downloads/dotfiles/custom ~/.oh-my-zsh/ &&
cp -vr ~/Downloads/dotfiles/snippets ~/.vim/
```

* The first line creates a ``vimBackups`` dir to store all vim backups
* 2nd line removes custom directory so the error that 'dir already exists' would be avoided when running 3rd and 4th line (from above)
* 4th line copies vim snippets

#### In case your drunk and forget how to configure vim-snippets or any other tools
Useful links and tuts:
* [Vim Essential Plugin: SnipMate - Tuts+ Code Tutorial](http://code.tutsplus.com/tutorials/vim-essential-plugin-snipmate--net-19356)

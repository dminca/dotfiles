# Git Submodules Cheat Sheet

## Setup the submodule for the first time
```
[~]$  cd ~/main/
[main]$  git submodule add git://github.com/my/submodule.git ./subm
[main]$  git submodule update --init
[main]$  git commit ./submodule -m "Added submodule as ./subm"
```

## Fetch submodules after cloning a repository: 
```
[~]$  git clone git://github.com/my/main.git ~/main
[~]$  cd ~/main/
[main]$  git submodule update --init
```

## Pull upstream main repo changes and update submodule contents:
```
[main]$  git pull origin/master
[main]$  git submodule update
```

## Pull upstream changes to the submodule: 
```
[main]$  cd ./subm
[subm]$  git pull origin/master   # or fetch then merge
[subm]$  cd ..
[main]$  git commit ./subm -m "Updated submodule reference"
```

## Edit and commit files in your submodule: 
```
[main]$  cd ./subm
[subm]$  edit whatever.rb
[subm]$  git commit whatever.rb -m "Updated whatever.rb"
[subm]$  cd ..
[main]$  git commit ./subm -m "Updated submodule reference"
```

## Push your submodule changes to the submodule upstream: 
```
[main]$  cd ./subm
[subm]$  git push origin master
```

## Update submodules
```
$ git submodule foreach 'git checkout master && git pull origin master'
```

## Update submodule's URL
> Edit the _.gitmodules_ file, then run:
```
$ git submodule sync
```

## Update All Submodules (no local changes)
```
$ git submodule update --remote [--recursive]
```

## Update All Submodules (with local changes)
```
$ git submodule update --remote [--rebase | --merge] [--recursive]
```

## Prepare All Submodules for Local Work
```
$ git submodule foreach 'git remote update; git checkout master; git pull origin master'
```

## Problems with submodule state update
> When switching branches and doing a submodule update (in SC: nova-simd and nova-tt”), git sometimes messes up the submodule status without you having touched it.
It will post something like:

```
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)
  (commit or discard the untracked or modified content in submodules)
modified:   external_libraries/nova-tt (untracked content)
```

> This can be remedied by deleting the file and updatind the submodules again (given you haven’t consciously made any changes, of course, which you’d lose!):

```
$ rm -r external_libraries/nova-tt
$ git submodule init
$ git submodule update
```

## Remove a submodule:
```
    edit .gitmodules and remove this submodule's section
    $ git rm --cached bundle/vim-sensible
    $ rm -rf bundle/vim-sensible
    $ git commit -m "Remove vim-sensible"
```
or
```
    git submodule deinit bundle/vim-sensible    
    git rm bundle/vim-sensible
    git commit -m "Remove vim-sensible"
``` 

#### sources:
* [Git submodules - Github](https://gist.github.com/mgiaco/3b9a3596beb6c8133bfc#submodules)
* [Git submodules cheatsheet](http://blog.jacius.info/git-submodule-cheat-sheet/)
* [Git submodules cheatsheet 2](http://bhilburn.org/cheat-sheet-for-git-submodules/)
* [Cheatsheet for git](http://supercollider.github.io/development/git-cheat-sheet.html)
* [Git cheatsheet - ricostacruz.com](http://ricostacruz.com/cheatsheets/git.html)
* [Git cheatsheet - rob allens dev notes](https://akrabat.com/git-submodules-cheat-sheet/)
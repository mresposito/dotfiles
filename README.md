dotfiles
========

Collections of tools I use to work, and a script to install them on a machine

## How to use

In order to stay up to date with the (many) plugins I have installed in my dotfiles, I make use of `git submodules`. In order to update all of the submodules, type

  $ git submodule foreach git pull origin master

This will pull from every repository, maintaining them up to date.

In order to add a submodule, then type
  
  $ git submodule add git://github.com/chneukirchen/rack.git rack

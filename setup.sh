#! /bin/sh
DIR=`pwd` #Dotfiles folder

#echo $DIR
cd ~/
ln -is $DIR/.bash_profile .bash_profile
ln -is $DIR/.ssh/config .ssh/config
ln -is $DIR/.emacs .emacs
ln -is $DIR/.path .path
ln -is $DIR/.bash_prompt .bash_prompt
ln -is $DIR/.exports .exports
ln -is $DIR/.aliases .aliases
ln -is $DIR/.functions .functions

ln -is $DIR/.gitconfig .gitconfig
ln -is $DIR/site-lisp .emacs.d/site-lisp

source ~/.bash_profile
cd $DIR

git submodules init
git submodules update

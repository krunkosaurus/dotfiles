#! /bin/sh
DIR=`pwd` #Dotfiles folder

#echo $DIR
cd ~/
ln -is $DIR/.bash_profile .bash_profile
ln -is $DIR/.ssh/config .ssh/config
ln -is $DIR/.emacs .emacs
ln -is $DIR/.gitconfig .gitconfig
ln -is $DIR/site-lisp .emacs.d/site-lisp

source ~/.bash_profile
cd $DIR

git submodules init
git submodules update

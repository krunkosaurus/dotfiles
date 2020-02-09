#!/bin/bash
DIR=`pwd` #Dotfiles folder

#echo $DIR
cd ~/
ln -is $DIR/.bash_profile .bash_profile
#ln -is $DIR/.ssh/config .ssh/config
ln -is $DIR/.emacs .emacs
ln -is $DIR/.gitconfig .gitconfig
ln -is $DIR/.path .path
ln -is $DIR/.bash_prompt .bash_prompt
ln -is $DIR/.export .export
ln -is $DIR/.alias .alias
ln -is $DIR/.functions .functions
ln -is $DIR/.emacs.d/site-lisp .emacs.d/site-lisp

. ~/.bash_profile
cd $DIR

git submodule init
git submodule update

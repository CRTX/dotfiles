#!/bin/bash

VundleUrl=https://github.com/gmarik/Vundle.vim.git
VundleDirectory=~/.vim/bundle/Vundle.vim

error () {
    exit 1;
}

trap error ERR


echo Checking to see if you have git installed.
dpkg -s "git" > /dev/null

echo Checking to see if you have vim-gtk installed.
dpkg -s "vim-gtk" > /dev/null

echo Copying .vimrc to home directory.
    cp .vimrc ~/.vimrc

echo Git cloning vundle plugin to home directory.

if [ ! -d $VundleDirectory ]; then
    git clone $VundleUrl $VundleDirectory
fi

echo Installing vundle plugins...
    vim +PluginInstall +qall

echo Done.

#!/bin/bash

VundleUrl=https://github.com/gmarik/Vundle.vim.git
VundleDirectory=~/.vim/bundle/Vundle.vim

error () {
    exit 1;
}

trap error ERR

checklist=(git vim-gtk)

for package in "${checklist[@]}"
do
    echo Checking to see if you have $package installed
    dpkg -s $package > /dev/null
done

echo Making backup and temporary files folder.
mkdir ~/.vim/backup
mkdir ~/.vim/tmp

echo Copying .vimrc to home directory.
    cp vimrc ~/.vimrc

echo Git cloning vundle plugin to home directory.

if [ ! -d $VundleDirectory ]; then
    git clone $VundleUrl $VundleDirectory
fi

echo Installing vundle plugins...
    vim +PluginInstall +qall

echo Done.

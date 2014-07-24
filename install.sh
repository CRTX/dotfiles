#!/bin/bash

VundleUrl=https://github.com/gmarik/Vundle.vim.git
VimDirectory=~/.vim
VundleDirectory=$VimDirectory/bundle/Vundle.vim

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
if [ ! -d $VimDirectory/backup ]; then
    mkdir -p $VimDirectory/backup
fi
if [ ! -d $VimDirectory/tmp ]; then
    mkdir -p $VimDirectory/tmp
fi

echo Copying .vimrc to home directory.
    cp vimrc ~/.vimrc

echo Git cloning vundle plugin to home directory.

if [ ! -d $VundleDirectory ]; then
    git clone $VundleUrl $VundleDirectory
fi

echo Installing vundle plugins...
    vim +PluginInstall +qall

echo Done.

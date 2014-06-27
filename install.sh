#!/bin/bash

VundleUrl=https://github.com/gmarik/Vundle.vim.git
VundleDirectory=~/.vim/bundle/Vundle.vim

error () {
    echo "Installation failed. Check for any error messages and try again."
    exit 1;
}

trap error ERR

echo "Checking to see if you have git installed."
check=$(dpkg -s "git")

echo "Checking if you have vim-gtk installed."
check=$(dpkg -s "vim-gtk")

echo "Copying .vimrc to home directory."
    cp .vimrc ~/.vimrc

echo "Git cloning vundle to home directory."

if [ ! -d $VundleDirectory ]; then
    git clone $VundleUrl $VundleDirectory
fi

echo "Installing plugins..."
    vim +PluginInstall +qall

echo Done.

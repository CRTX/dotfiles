#!/bin/bash

VundleUrl=https://github.com/gmarik/Vundle.vim.git
VimDirectory=~/.vim
VundleDirectory=$VimDirectory/bundle/Vundle.vim
RequiredDirectories=($VimDirectory/backup $VimDirectory/tmp)

error () {
    exit 1;
}

makeDir () {
    if [ ! -d $1 ]; then
        mkdir -p $1
    fi
}

trap error ERR

sudo apt update && sudo apt install git vim-gtk exuberant-ctags tmux build-essential ruby-dev -y

checklist=(git vim-gtk exuberant-ctags tmux)

for package in "${checklist[@]}"; do
    echo Checking to see if you have $package installed...
    dpkg -s $package > /dev/null
    echo $package is installed.
done

echo Making backup and temporary files folder.
for directory in "${RequiredDirectories[@]}"; do
    makeDir $directory
done

echo Copying .vimrc to home directory.
    cp vimrc $HOME/.vimrc

echo Git cloning vundle plugin to home directory.

if [ ! -d $VundleDirectory ]; then
    git clone $VundleUrl $VundleDirectory
fi

echo Installing vundle plugins...
    vim +PluginInstall +qall
    cp neosnippets/php.snip $HOME/.vim/bundle/neosnippet-snippets/neosnippets/php.snip

echo "Compiling command-t vim plugin..."
cd ~/.vim/bundle/command-t/ruby/command-t/ext/command-t && \
ruby extconf.rb && \
make

cat ./bashrc >> ~/.bashrc

echo Done.

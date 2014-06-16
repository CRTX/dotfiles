git --version 2>&1 >/dev/null
GIT_IS_AVAILABLE=$?

if [ $GIT_IS_AVAILABLE -eq 0 ]; then
    echo "Installing..."
else
    echo "Git is not installed. Please install git."
    exit 1
fi

echo "Copying .vimrc to home directory."
    cp .vimrc ~/.vimrc
echo "Cloning vundle to home directory."
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "Installing plugins..."
    vim +PluginInstall +qall
echo Done.

set -e

git --version 2>&1 >/dev/null
HAS_GIT=$?
dpkg -s "vim-gtk" &>/dev/null
HAS_VIMGTK=$?

VUNDLE_URL=https://github.com/gmarik/Vundle.vim.git
VUNDLE_DIR=~/.vim/bundle/Vundle.vim

if [ $HAS_VIMGTK -eq 1 ]; then
    echo "Please install the vim-gtk package and rerun this script."
    exit 1
fi


if [ $HAS_GIT -eq 0 ]; then
    echo "Installing..."
else
    echo "Git is not installed. Please install git."
    exit 1
fi

echo "Copying .vimrc to home directory."
    cp .vimrc ~/.vimrc

echo "Cloning vundle to home directory."

if [ ! -d $VUNDLE_DIR ]; then
    git clone $VUNDLE_URL $VUNDLE_DIR
fi

echo "Installing plugins..."
    vim +PluginInstall +qall

echo Done.

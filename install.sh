cd $HOME

sudo apt install git vim gcc tmux

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

# bash setup
rm -f $HOME/.bashrc
rm -rf $HOME/.bash
ln -sv $SCRIPTPATH/bash/bashrc $HOME/.bashrc
ln -sv $SCRIPTPATH/bash/bash $HOME/.bash

# vim setup
rm -f $HOME/.vimrc
rm -rf $HOME/.vim
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
ln -sv $SCRIPTPATH/vim/vimrc $HOME/.vimrc
vim -c 'PluginInstall' -c 'qa!'

# input setup
rm -f $HOME/.inputrc
ln -sv $SCRIPTPATH/input/inputrc $HOME/.inputrc

# tmux setup
rm -f $HOME/.tmux.conf
ln -sv $SCIRPTPATH/tmux/tmux.conf $HOME/.tmux.conf

# alacritty setup
mkdir -pv ~/.config
rm -rf .config/alacritty
ln -sv $SCRIPTPATH/alacritty $HOME/.config/alacritty

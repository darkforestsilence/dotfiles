#if [[ -f /etc/os-release ]]; then
#	source /etc/os-release
#	case $ID_LIKE in
#		*ubuntu*|*debian*)
#			sudo apt install vim gcc tmux alacritty
#			;;
#		*)
#			echo "Unknown os variant"
#			;;
#	esac
#else
#	echo "Could not detect OS type"
#fi



SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

# bash setup
rm -f $HOME/.bashrc
rm -rf $HOME/.bash
ln -s $SCRIPTPATH/bash/bashrc $HOME/.bashrc
ln -s $SCRIPTPATH/bash/bash $HOME/.bash

# vim setup
rm -f $HOME/.vimrc
rm -rf $HOME/.vim
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
ln -s $SCRIPTPATH/vim/vimrc $HOME/.vimrc
vim -c 'PluginInstall' -c 'qa!'

# input setup
rm -f $HOME/.inputrc
ln -s $SCRIPTPATH/input/inputrc $HOME/.inputrc

# tmux setup
rm -f $HOME/.tmux.conf
ln -s $SCIRPTPATH/tmux/tmux.conf $HOME/.tmux.conf

# alacritty setup
mkdir -p $HOME/.config
rm -rf $HOME/.config/alacritty
ln -s $SCRIPTPATH/alacritty $HOME/.config/alacritty

# everything is set up so reload the configuration files
# and create some directories for libraries and c/c++
mkdir -p $HOME/{bin,lib,include}
bind -f $HOME/.inputrc
source ~/.bashrc

sh -c "$(curl -sSL sh.rustup.rs)"

echo "nyah" > $HOME/.girl

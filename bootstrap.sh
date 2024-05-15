#!/bin/bash

SOURCE=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
cd $SOURCE
git pull origin master;

# Symlink dotfiles
function link() {
	ln -s ${SOURCE}/.aliases ~/.aliases
	ln -s ${SOURCE}/.hushlogin ~/.hushlogin
	ln -s ${SOURCE}/.motd ~/.motd
	ln -s ${SOURCE}/.screenrc ~/.screenrc
	ln -s ${SOURCE}/.vimrc ~/.vimrc
	ln -s ${SOURCE}/.zshrc ~/.zshrc
	ln -s ${SOURCE}/.gitconfig ~/.gitconfig
	ln -s ${SOURCE}/.gitignore_global ~/.gitignore_global
	ln -s ${SOURCE}/starship.toml ~/.config/starship.toml
}

# Install ZSH
if [ ! -s "${HOME}/.oh-my-zsh" ]
then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	rm ~/.zshrc
	# Custom plugins
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

link;
unset link;

# Setup VIM
# Plugged plugin manager
if [ ! -s "$HOME/.vim/autoload/plug.vim" ]
then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# If we're on a Mac, let's setup homebrew and macOS config.
if [ "$(uname -s)" = "Darwin" ]
then
	if [ -x "$(command -v foo)" ]
	then
		# Install Brew (https://brew.sh/)
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	fi
	# Install Dependencies
	brew bundle
	# Run macos configuration
	source .macos;
fi

source ~/.zshrc;


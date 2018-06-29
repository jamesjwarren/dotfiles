#!/usr/bin/env bash

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
}

link;
unset link;

# Install ZSH
if [ "$(command -v zsh)" == "" ]
then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# If we're on a Mac, let's setup homebrew and macOS config.
if [ "$(uname -s)" == "Darwin" ]
then
	if [ "$(command -v brew)" == "" ]
	# Install Brew (https://brew.sh/)
	then
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	fi
	# Install Dependencies
	brew bundle
	# Run macos configuration
	source .macos;
fi

source ~/.zshrc;

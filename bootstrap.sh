#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";
git pull origin master;

# Symlink dotfiles
function link() {
	ln -s .aliases ~/.aliases
	ln -s .hushlogin ~/.hushlogin
	ln -s .motd ~/.motd
	ln -s .screenrc ~/.screenrc
	ln -s .vimrc ~/.vimrc
	ln -s .zshrc ~/.zshrc
}

link;
unset link;

# Install ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# If we're on a Mac, let's setup homebrew.
if [ "$(uname -s)" == "Darwin" ]
then
	# Install Brew (https://brew.sh/)
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	# Install Dependencies
	brew bundle
	# Run macos configuration
	source .macos;
fi

source ~/.zshrc;

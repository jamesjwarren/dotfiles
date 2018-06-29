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

source ~/.zshrc;

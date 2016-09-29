#!/bin/sh
mkdir -p ~/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.zshrc.alias ~/.zshrc.alias
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/private.xml ~/Library/Application\ Support/Karabiner/private.xml

ln -sf ~/dotfiles/.vimrc.set ~/.vim/.vimrc.set
ln -sf ~/dotfiles/.vimrc.keymap ~/.vim/.vimrc.keymap
ln -sf ~/dotfiles/.vimrc.plugins ~/.vim/.vimrc.plugins
ln -sf ~/dotfiles/.vimrc.script ~/.vim/.vimrc.script


mkdir ~/local
ln -sf ~/dotfiles/local/script ~/local/script

#!/usr/bin/env sh

ln -sf ~/dev/haywoood/.zshrc ~/.zshrc
ln -sf ~/dev/haywoood/.gitconfig ~/.gitconfig
ln -sf ~/dev/haywoood/.doom.d ~/.doom.d
ln -sf ~/dev/haywoood/.tmux.conf ~/.tmux.conf

mkdir -p ~/.config/ghostty
ln -sf ~/dev/haywoood/.config/ghostty/config ~/.config/ghostty/config

mkdir -p ~/.local/bin
ln -sf ~/dev/haywoood/.local/bin/h ~/.local/bin/h

#!/bin/bash

brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

brew_items=(git gh neovim fd fzf bat exa lazygit pure tmux stow zoxide rg gemini-cli)

for i in ${brew_items[@]}
do
  brew install $i
done

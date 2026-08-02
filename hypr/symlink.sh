#!/bin/bash
echo \n removing folders...
rm $HOME/.config/hypr $HOME/.config/quickshell
echo done!
echo \n making symlinks.....
ln -s $HOME/dotfiles/hypr $HOME/.config/hypr
ln -s $HOME/dotfiles/quickshell $HOME/.config/quickshell]
echo done!

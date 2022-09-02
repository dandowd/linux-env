#!/usr/bin/bash

cp i3/config /home/$USER/.config/i3
cp i3/layouts/* /home/$USER/.config/i3/layouts
cp -r i3blocks/* /home/$USER/.config/i3blocks/

cp tmux/battle /home/$USER/Work
chmod 700 /home/$USER/Work/battle

cp tmux/tmux.conf /home/.tmux.conf
cp tmux/tmux-load /home/$USER/Work
chmod 700 /home/$USER/Work/tmux-load

cp services/neat-services /home/$USER/.bin
chmod 700 /home/$USER/.bin/neat-services

cp git/git-all-status /home/$USER/.bin
chmod 700 /home/$USER/.bin/git-all-status

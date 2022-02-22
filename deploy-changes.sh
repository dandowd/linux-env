#!/bin/bash

cp i3/config /home/$USER/.config/i3
cp i3/workspace* /home/$USER/Work

cp tmux/battle.sh /home/$USER/Work
chmod 700 /home/$USER/Work/battle.sh

cp tmux/tmux-load.sh /home/$USER/Work
chmod 700 /home/$USER/Work/tmux-load.sh

cp services/neat-services.sh /home/$USER/Work
chmod 700 /home/$USER/Work/neat-services.sh

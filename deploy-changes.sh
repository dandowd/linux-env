#!/bin/bash

cp i3/config /home/$USER/.i3/config
cp i3/layouts/* /home/$USER/.i3/layouts

cp tmux/battle.sh /home/$USER/Work
chmod 700 /home/$USER/Work/battle.sh

cp tmux/tmux-load.sh /home/$USER/Work
chmod 700 /home/$USER/Work/tmux-load.sh

cp services/neat-services.sh /home/$USER/Work
chmod 700 /home/$USER/Work/neat-services.sh

cp git/git-all-status.sh /home/$USER/.bin
chmod 700 /home/$USER/.bin/git-all-status.sh

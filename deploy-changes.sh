#!/bin/bash

cp i3/config /home/$USER/.i3/config
cp i3/layouts/* /home/$USER/Work/.i3/layouts

cp tmux/battle.sh /home/$USER/Work
chmod 700 /home/$USER/Work/battle.sh

cp tmux/tmux-load.sh /home/$USER/Work
chmod 700 /home/$USER/Work/tmux-load.sh

cp services/neat-services.sh /home/$USER/Work
chmod 700 /home/$USER/Work/neat-services.sh

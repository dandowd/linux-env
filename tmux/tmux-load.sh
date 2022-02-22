#!/bin/bash

sync_panes() {
	tmux setw synchronize-panes $1
}

create_layout() {
	tmux split-window -v
}

clear_console() {
	tmux send-keys clear Enter
}

end() {
	tmux select-window -t 1
	tmux select-pane -t 0
}

WINDOW_ONE="server"
WINDOW_ONE_LOCATION="~/Work/server"

tmux new-window -n $WINDOW_ONE
create_layout

sync_panes on
tmux send-keys "cd $WINDOW_ONE_LOCATION" Enter
clear_console
sync_panes off

tmux select-pane -t 0
tmux send-keys "npm start" Enter

WINDOW_TWO="neatify"
WINDOW_TWO_LOCATION="~/Work/mortgage-dashboard-client"

tmux new-window -n $WINDOW_TWO
create_layout

sync_panes on
tmux send-keys "cd $WINDOW_TWO_LOCATION" Enter
clear_console
sync_panes off

tmux select-pane -t 0
tmux send-keys "npm start"

WINDOW_THREE="application"
WINDOW_THREE_LOCATION="~/Work/application"


tmux new-window -n $WINDOW_THREE
create_layout

sync_panes on
tmux send-keys "cd $WINDOW_THREE_LOCATION" Enter
clear_console
sync_panes off

tmux select-pane -t 0
tmux send-keys "npm start"

WINDOW_FOUR="order"
WINDOW_FOUR_LOCATION="~/Work/order-service"

tmux new-window -n $WINDOW_FOUR
create_layout

sync_panes on
tmux send-keys "cd $WINDOW_FOUR_LOCATION" Enter
clear_console
sync_panes off

tmux select-pane -t 0
tmux send-keys "npm start"

WINDOW_FIVE="db"

tmux new-window -n $WINDOW_FIVE
tmux send-keys "sudo -i -u postgres"
create_layout
tmux send-keys mongosh Enter

end

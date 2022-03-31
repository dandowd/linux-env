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

BASE_LOC="~/Work"

# server
tmux new-window -n "server"
create_layout

sync_panes on
tmux send-keys "cd $BASE_LOC/server" Enter
clear_console
sync_panes off

tmux select-pane -t 0
tmux send-keys "npm start" Enter

# neatify
tmux new-window -n "neatify"
create_layout

sync_panes on
tmux send-keys "cd $BASE_LOC/mortgage-dashboard-client" Enter
clear_console
sync_panes off

tmux select-pane -t 0
tmux send-keys "npm start"

# application
tmux new-window -n "application"
create_layout

sync_panes on
tmux send-keys "cd $BASE_LOC/application" Enter
clear_console
sync_panes off

tmux select-pane -t 0
tmux send-keys "npm start"

# order-service
tmux new-window -n "order"
create_layout

sync_panes on
tmux send-keys "cd $BASE_LOC/order-service" Enter
clear_console
sync_panes off

tmux select-pane -t 0
tmux send-keys "npm start"

# domo-service
tmux new-window -n "domo"
create_layout

sync_panes on
tmux send-keys "cd $BASE_LOC/domo-service" Enter
clear_console
sync_panes off

tmux select-pane -t 0
tmux send-keys "npm start"

# db window
tmux new-window -n "db"
tmux send-keys "sudo -i -u postgres"
create_layout
tmux send-keys mongosh Enter

# neat-core-js
tmux new-window -n "neat-core"
create_layout

sync_panes on
tmux send-keys "cd $BASE_LOC/neat-core-js" Enter
clear_console
sync_panes off

end

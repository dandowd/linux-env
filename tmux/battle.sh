#!/bin/bash

SESSION_NAME="neat"
tmux has-session -t $SESSIONS_NAME &> /dev/null

if [ $? != 0 ]
then
	tmux new-session -s $SESSION_NAME -n script -d
	tmux send-keys -t $SESSION_NAME "./tmux-load.sh" C-m
fi

tmux attach -t $SESSION_NAME

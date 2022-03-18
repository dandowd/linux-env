#!/bin/bash

req_dirs=("/home/$USER/Work" "/home/$USER/.i3" "/home/$USER/.i3/layouts" "/home/$USER/.bin")

for dir in ${req_dirs[@]}; do
	if [ ! -d $dir ]
	then
		echo "creating $dir"
		mkdir $dir
	else
		echo "$dir already exists"
	fi
done
#!/bin/bash

gitDirectories=(application domo-service mortgage-dashboard-client neat-core-js order-service server enums)

COLOR='\033[0;34m'
NC='\033[0m'

for d in ${gitDirectories[@]}; do
	echo -e "${COLOR}Directory: $d${NC}"
	git -C /home/$USER/Work/$d status
done

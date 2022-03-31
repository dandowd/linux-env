#!/bin/bash

SERVICES=(rabbitmq-server redis-server mongod)

for s in ${SERVICES[@]}; do
	echo "$1ing: $s"
	sudo systemctl $1 $s
done

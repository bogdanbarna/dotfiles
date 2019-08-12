#!/usr/bin/env bash

set -xeu

# Install
wget https://download.docker.com/mac/stable/Docker.dmg
open Docker.dmg
read -r -p "Ready to move on?"

# Start
sleep_time=30 # seconds
open /Applications/Docker.app
while ! docker ps >/dev/null 2>&1; do
	sleep $sleep_time;
	sleep_time=$((sleep_time * 2))
	if [[ $sleep_time -ge 300 ]]; then
		echo "Timed out waiting for Docker for Mac to start" && exit 3
	fi
done
echo "Docker for Mac is up"

# Configure
ln -s "$(pwd)"/dot-docker ~/.docker

# Validate
docker --version && docker-compose --version
docker run hello-world

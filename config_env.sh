#!/usr/bin/env bash

source env.sh

# Colors
COL_RESET=$'\e[39;49;00m'
RED=$'\e[31;01m'
GREEN=$'\e[32;01m'
YELLOW=$'\e[33;01m'
BLUE=$'\e[34;01m'
MAGENTA=$'\e[35;01m'
CYAN=$'\e[36;01m'

echo "${YELLOW}======= Config docker environment variables ======${COL_RESET}"
rm -f docker-compose.yml
envsubst < "docker-compose.yml.dist" > "docker-compose.yml"
rm -f ./custom-ubuntu/Dockerfile
envsubst < "./custom-ubuntu/Dockerfile.dist" > "./custom-ubuntu/Dockerfile"
rm -f ./create-machine/bootsync.sh
envsubst < "./create-machine/bootsync.sh.dist" > "./create-machine/bootsync.sh"
rm -f ./custom-ubuntu/conf/.zsh_aliases
envsubst < "./custom-ubuntu/conf/.zsh_aliases.dist" > "./custom-ubuntu/conf/.zsh_aliases"
echo "${GREEN}======= Done ! =======${COL_RESET}"

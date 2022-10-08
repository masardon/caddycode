#!/bin/bash

Red='\033[0;31m'
Green='\033[0;32m'
NC='\033[0m'
On_Green='\033[42m'
On_Red='\033[41m'
On_Blue='\033[44m'

echo "-------------------------------------"
echo "Checking Required File(s) & Volume(s)"
echo "-------------------------------------"

# Checking Required Files
if [ -f $PWD/Caddyfile ] && [ -f $PWD/.config/code-server/config.yaml ] && [ -f $PWD/docker-compose.yml ]
then
        echo -e "${Green}Great!! All required files found!${NC}"
else
        echo -e "${Red}One or more required file(s) doesn't exists. Please check!${NC}"
        exit 9999
fi

# Checking Required Volumes
if [ -d $PWD/caddy_config ] && [ -d $PWD/caddy_data ] && [ -d $PWD/project ]
# if [ -d $PWD/caddy_config ] && [ -d $PWD/caddy_data ] && [ -d $PWD/.data ] && [ -d $PWD/.ssh ] && [ -d $PWD/cert ] && [ -d $PWD/project ]
then
        echo -e "${Green}Woyoo!! All required volumes found!${NC}"
        echo "------------------------------------"
        echo "We have all green now. Let's proceed!"
        echo "------------------------------------"
else
        echo -e "${Red}One or more required volume(s) doesn't exists. Please check!${NC}"
        exit 9999
fi

echo "Which one do you want to execute :"
echo -e "--- ${On_Green}DEPLOY${NC} - to deploy/update docker stack"
echo -e "--- ${On_Red}REMOVE${NC} - to remove docker stack"
echo -e "--- ${On_Blue}STATUS${NC} - to check docker stack status"
read -p "Enter your option (DEPLOY/REMOVE/STATUS) : " COMMAND

if [ $COMMAND == 'DEPLOY' ]
then
    echo "Deploying Docker Stack"
    docker stack deploy -c docker-compose.yml caddycode
elif [ $COMMAND == 'REMOVE' ]
then
    echo "Removing Docker Stack"
    docker stack rm caddycode
elif [ $COMMAND == 'STATUS' ]
then
    docker stack services caddycode
else
    echo "Please select the correct options!"
    exit 9999
fi
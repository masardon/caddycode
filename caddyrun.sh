#!/bin/bash

echo "---------------------------------"
echo "Checking Required Files & Volumes"
echo "---------------------------------"

# Checking Required Files
if [ -f $PWD/Caddyfile ] && [ -f $PWD/.config/code-server/config.yaml ] && [ -f $PWD/docker-compose.yml ]
then
        echo "Great! All required files found!"
else
        echo "One or more required file(s) doesn't exists. Please check!"
        exit 9999
fi

# Checking Required Volumes
if [ -d $PWD/caddy_config ] && [ -d $PWD/caddy_data ] && [ -d $PWD/.data ] && [ -d $PWD/.ssh ] && [ -d $PWD/cert ] && [ -d $PWD/project ]
then
        echo "Woyoo!! All required volumes exists"
else
        echo "One or more required volume(s) doesn't exists. Please check!"
        exit 9999
fi

echo "Which one do you want to execute :"
echo "DEPLOY - to deploy/update docker stack"
echo "REMOVE - to remove docker stack"
echo "STATUS - to check docker stack status"
read -p "Enter your option : " COMMAND

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
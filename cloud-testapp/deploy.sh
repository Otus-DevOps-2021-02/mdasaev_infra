#!/bin/bash

if [[ $(git --version) == *"command not found"* ]]
then
    sudo apt-get install -y git
    echo "Git installed with version $(git --version)"
fi

echo "cloning app source code"
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install

echo "starting the app"

puma -d

echo "app is running on port $(ps aux | grep puma | grep port | cut -d " " -f28) "

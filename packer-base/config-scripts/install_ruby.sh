#!/bin/bash

if [[ $(ruby -v) == *"command not found"* ]]
then
  sudo apt update
  sudo apt install -y ruby-full ruby-bundler build-essential
  echo "Successfully installed ruby with version $(ruby -v)"
else
  echo "Ruby already installed with version $(ruby -v)"
fi

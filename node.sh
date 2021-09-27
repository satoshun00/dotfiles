#!/usr/bin/env bash

if which nodebrew > /dev/null; then
  echo "Skip nodebrew installation."
else
  curl -L git.io/nodebrew | perl - setup
  source ~/.bashrc
  nodebrew install v14.17.6
  nodebrew use v14.17.6
fi

npm i -g firebase-tools

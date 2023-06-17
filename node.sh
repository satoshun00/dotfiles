#!/usr/bin/env bash

if which nodebrew > /dev/null; then
  echo "Skip nodebrew installation."
else
  curl -L git.io/nodebrew | perl - setup
  source ~/.bashrc
  nodebrew install v18.16.0
  nodebrew use v18.16.0
fi

npm i -g firebase-tools

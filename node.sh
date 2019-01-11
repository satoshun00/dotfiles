#!/usr/bin/env bash

if which nodebrew > /dev/null; then
  echo "Skip nodebrew installation."
else
  curl -L git.io/nodebrew | perl - setup
  source ~/.bashrc
  nodebrew install v11.6.0
  nodebrew use v11.6.0
fi

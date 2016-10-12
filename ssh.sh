#!/usr/bin/env bash

SSH_KEY="${HOME}/.ssh/id_rsa"

if [ ! -f "${SSH_KEY}" ] || [ ! -f "${SSH_KEY}.pub" ]; then
  echo 'Generating ssh key.'
  ssh-keygen -f "${SSH_KEY}" -t rsa -N ''
  ssh-add "${SSH_KEY}"
else
  echo 'Skip ssh key generation.'
fi

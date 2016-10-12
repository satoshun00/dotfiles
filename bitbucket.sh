#!/usr/bin/env bash

USERNAME=$(git config --get user.name)
SSH_KEY="${HOME}/.ssh/id_rsa"
KEY_NAME="$(whoami)@$(hostname)"

echo 'This setup requires your Bitbucket Password.'

# POST ssh-pubkey to Bitbucket
echo 'Enter your Password for Bitbucket .'
result=$(curl -X POST --silent -u "${USERNAME}" --data "label=${KEY_NAME};key=$(node -e "console.log(encodeURIComponent(\"$(cat ~/.ssh/id_rsa.pub)\"))")" "https://api.bitbucket.org/1.0/users/${USERNAME}/ssh-keys")
if echo "${result}" | grep -q 'Someone has already registered that SSH key'; then
  echo 'Key is already in use.'
elif echo "${result}" | grep -q '"pk":'; then
  echo "Key (${KEY_NAME}) has been added successfully."
else
  echo 'A problem occured during the upload!'
  echo "${result}"
  echo 'Try again!'
fi

#!/usr/bin/env bash

USERNAME=$(git config --get user.name)
SSH_KEY="${HOME}/.ssh/id_rsa"
KEY_NAME="$(whoami)@$(hostname)"

echo 'This setup requires your Github Personal access token.'

echo 'You can create new Personal access token here: https://github.com/settings/tokens'

echo 'hint: You need to check "write:public_key" scope to run this script.'

echo 'Enter your Github Personal access token (To skip this setup, just press ENTER).'

read -e GITHUB_TOKEN

[ -n "${GITHUB_TOKEN}" ] || exit 0;

# POST ssh-pubkey to Github

result=$(curl --silent -u "${USERNAME}:${GITHUB_TOKEN}" --data "{\"title\":\"${KEY_NAME}\",\"key\":\"$(cat ${SSH_KEY}.pub)\"}" https://api.github.com/user/keys)
if echo "${result}" | grep -q 'key is already in use'; then
  echo 'Key is already in use.'
elif echo "${result}" | grep -q '"verified": true'; then
  echo "Key (${KEY_NAME}) has been added successfully."
elif echo "${result}" | grep -q 'Bad credentials'; then
  echo 'Error during login: invalid username or password!'
  echo 'Try again!'
else
  echo 'A problem occured during the upload!'
  echo "${result}"
  echo 'Try again!'
fi

#!/usr/bin/env bash

GITHUB_USERNAME=$(git config --get user.name)
SSH_KEY="${HOME}/.ssh/id_rsa"
KEY_NAME="$(whoami)@$(hostname)"

echo 'This setup requires your Github Password and Two-Factor authentication code.'

echo 'Enter your Two-Factor authentication code (To skip this setup, just press ENTER).'

read -e GITHUB_OTP

[ -n "${GITHUB_OTP}" ] || exit 0;

result=$(curl --silent -u "${GITHUB_USERNAME}" --header "X-GitHub-OTP: ${GITHUB_OTP}" --data "{\"title\":\"${KEY_NAME}\",\"key\":\"$(cat ${SSH_KEY}.pub)\"}" https://api.github.com/user/keys)
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

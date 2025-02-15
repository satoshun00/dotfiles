#!/usr/bin/env bash

curl https://mise.run | sh

eval "$(~/.local/bin/mise activate bash)"

mise use --global node@22

corepack enable
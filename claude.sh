#!/usr/bin/env bash

# Install Claude Code (https://claude.com/claude-code) using the official
# native installer. It is self-contained, auto-updates, and does not depend
# on a Node.js toolchain.

if test ! "$(which claude)"; then
  echo "Installing Claude Code..."
  curl -fsSL https://claude.ai/install.sh | bash
fi

claude --version

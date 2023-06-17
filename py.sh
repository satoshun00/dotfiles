#!/usr/bin/env bash

# ~/py.sh

# Removed user's cached credentials
# This script might be run with .dots, which uses elevated privileges
sudo -K

###############################################################################
# Virtual Enviroments                                                         #
###############################################################################

echo "------------------------------"
echo "Setting up virtual environments."

# Install virtual environments globally
# It fails to install virtualenv if PIP_REQUIRE_VIRTUALENV was true
export PIP_REQUIRE_VIRTUALENV=false
pip install --upgrade virtualenv
pip install --upgrade virtualenvwrapper

echo "------------------------------"
echo "Source virtualenvwrapper"

export WORKON_HOME=~/.virtualenvs
source /opt/homebrew/bin/virtualenvwrapper.sh

###############################################################################
# Python 3 Virtual Enviroment                                                 #
###############################################################################

echo "------------------------------"
echo "Setting up py3 virtual environment."

# Create a Python3 environment
mkvirtualenv --python=/opt/homebrew/bin/python3 py3
workon py3

echo "------------------------------"
echo "Script completed."
echo "Usage: workon py3 for Python3"

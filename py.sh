#!/usr/bin/env bash

# ~/py.sh

# Removed user's cached credentials
# This script might be run with .dots, which uses elevated privileges
sudo -K

echo "------------------------------"
echo "Setting up pip."

# Install pip
easy_install pip

# Tensorflow deps
easy_install -U six
easy_install -U numpy
easy_install wheel
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
source /usr/local/bin/virtualenvwrapper.sh

###############################################################################
# Python 2 Virtual Enviroment                                                 #
###############################################################################

echo "------------------------------"
echo "Setting up py2 virtual environment."

# Create a Python2 environment
mkvirtualenv py2
workon py2

export PIP_DEFAULT_TIMEOUT=300
# Install Python modules
pip install --upgrade numpy
pip install --upgrade scipy
pip install --upgrade matplotlib
pip install --upgrade pandas
pip install --upgrade sympy
pip install --upgrade nose
pip install --upgrade unittest2
pip install --upgrade seaborn
pip install --upgrade scikit-learn
pip install --upgrade "ipython[all]"

###############################################################################
# Python 3 Virtual Enviroment                                                 #
###############################################################################

echo "------------------------------"
echo "Setting up py3 virtual environment."

# Create a Python3 environment
mkvirtualenv --python=/usr/local/bin/python3 py3
workon py3

export PIP_DEFAULT_TIMEOUT=300
# Install Python modules
pip install --upgrade numpy
pip install --upgrade scipy
pip install --upgrade matplotlib
pip install --upgrade pandas
pip install --upgrade sympy
pip install --upgrade nose
pip install --upgrade unittest2
pip install --upgrade seaborn
pip install --upgrade scikit-learn
pip install --upgrade scikit-image
pip install --upgrade "ipython[all]"
pip install --upgrade "https://storage.googleapis.com/tensorflow/mac/cpu/tensorflow-0.12.0rc1-py3-none-any.whl"

echo "------------------------------"
echo "Script completed."
echo "Usage: workon py2 for Python2"
echo "Usage: workon py3 for Python3"

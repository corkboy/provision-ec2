#!/usr/bin/env bash

# INSTALL XCODE
if [[ `xcode-select -p` != "/Applications/Xcode.app/Contents/Developer" && `xcode-select -p` != "/Applications/Xcode-beta.app/Contents/Developer" ]]; then
  echo "Install XCode from the App Store"
  exit 1
else
  echo "XCode is installed!"
fi

# INSTALL XCODE-SELECT
declare xcode_select_installed=`xcode-select --install 2>&1 | grep "command line tools are already installed"`
if [ -z "$xcode_select_installed" ]; then
  echo "Installing xcode-select"
  xcode-select --install
else
  echo "xcode-select installed!"
fi

# INSTALL DOCKER
if [ ! -x /usr/local/bin/docker ]; then
  echo "Install Docker for Mac: https://www.docker.com/products/docker#/mac"
  exit 1
else
    echo "Docker is installed!"
fi

# INSTALL HOMEBREW
if [ ! -x /usr/local/bin/brew ]; then
    echo "installing homebrew..."
    /usr/bin/env ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "homebrew is installed!"
fi

# INSTALL ANSIBLE
if [ ! -x /usr/local/bin/ansible ]; then
    echo "installing ansible..."
    brew install ansible
else
    echo "ansible is installed!"
fi

# INSTALL PYTHON
if [ ! -x /Library/Python/ ]; then
    echo "installing python..."
    brew install python
else
    echo "python is installed!"
fi

# INSTALL BOTO (python module for AWS)
if [ ! -x /Library/Python/2.7/site-packages/boto ]; then
    echo "installing python boto..."
    pip install boto
else
    echo "boto is installed!"
fi

#if [ ! -x /usr/local/bin/ansible ]; then
#    echo "installing docker-py"
#    pip install docker-py
#else
#    echo "ansible is installed"
#fi

echo "---------------------------------------------"
echo "Your dev environment is now configured!"
echo "---------------------------------------------"

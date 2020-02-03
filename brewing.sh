#!/bin/bash

# Install all the Mac specific things using HomeBrew

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install ripgrep
brew install hub

echo 'alias git="hub"' >> ~/.bash_profile

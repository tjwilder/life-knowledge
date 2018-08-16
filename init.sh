#!/bin/bash

# CONSTANTS
BASE_SCRIPTS_DIR="$HOME/scripts"
DOCKER_SCRIPTS_DIR="${BASE_SCRIPTS_DIR}/docker"
GIT_SCRIPTS_DIR="${BASE_SCRIPTS_DIR}/git"
GENERAL_SCRIPTS_DIR="${BASE_SCRIPTS_DIR}/general"

SCRIPT_RC="${BASE_SCRIPTS_DIR}/.scriptrc"

# SETUP REQUIRED LINUX PROGRAMS #

## INSTALL SCRIPTS

### Create Script Directories
mkdir -p $BASE_SCRIPTS_DIR
mkdir -p $DOCKER_SCRIPTS_DIR
mkdir -p $GIT_SCRIPTS_DIR
mkdir -p $GENERAL_SCRIPTS_DIR

### COPY SCRIPTS

#### Docker & Docker-Compose Scripts
cp ./scripts/docker/* $DOCKER_SCRIPTS_DIR

#### Git Scripts
cp ./scripts/git/* $GIT_SCRIPTS_DIR

### General Scripts
cp ./scripts/general/* $GENERAL_SCRIPTS_DIR

### UPDATE PATH
if ! grep -Fq $SCRIPT_RC ~/.bashrc; then
	echo "source $SCRIPT_RC" >> ~/.bashrc
	touch $SCRIPT_RC
	echo 'export PATH="${BASE_SCRIPTS_DIR}:$PATH"' >> $SCRIPT_RC
fi

## SET DEFAULT ENV VARS

#### Allow Docker on WSL
#echo 'export DOCKER_HOST="tcp://localhost:2375"' >> $SCRIPT_RC

# SETUP WINDOWS PROGRAMS #
# ngrok #
# code editor? #
# lice cap # For capturing gifs

## Config Files
### Vim
cp ./config/vim/* ~/
##### Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

### Tmux
cp ./config/tmux/* ~/
##### Install TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

## WSL (Windows Subsystem for Linux) Stuff
if grep -q Microsoft /proc/version; then
	tput setaf 6; echo 'Initializing WSL...'; tput sgr0
	### Fix Docker mounting (mostly)
	tput setaf 7
	echo 'Fixing docker mounting requires manual intervention'
	echo 'Copy the following 6 lines into ~/.bashrc and fill in the password'
	echo 'You can also do this manually when you open WSL if you prefer not to have your password in plaintext'
	tput sgr0
	echo
	echo "# Create the /c directory if it doesn't exist"
	echo 'mkdir -p /c'
	echo "# sudo mount the default /mnt/c onto just /c"
	echo "echo 'YOUR_PASSWORD_HERE' | sudo -S -p ' ' mount --bind /mnt/c /c"
	echo 'cd ${PWD#/mnt}'
	echo 'echo # for formatting'
	echo
fi

## Native linux-specific stuff (not WSL)
if ! grep -q Microsoft /proc/version; then
	### If I ever get anything...
	echo
fi

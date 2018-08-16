#!/bin/bash

# CONSTANTS
BASE_SCRIPTS_DIR='~/scripts'
DOCKER_SCRIPTS_DIR='$BASE_SCRIPTS_DIR/docker'
GIT_SCRIPTS_DIR='$BASE_SCRIPTS_DIR/git'
SCRIPT_RC='$BASE_SCRIPTS_DIR/.scriptrc'

# SETUP REQUIRED LINUX PROGRAMS #

## INSTALL SCRIPTS

### Create Script Directories
mkdir $BASE_SCRIPTS_DIR
mkdir $DOCKER_SCRIPTS_DIR
mkdir $GIT_SCRIPTS_DIR

### COPY SCRIPTS

#### Docker & Docker-Compose Scripts
cp ./scripts/docker $DOCKER_SCRIPTS_DIR

#### Git Scripts
cp ./scripts/git $GIT_SCRIPTS_DIR

### UPDATE PATH
if [ grep ~/.bashrc $SCRIPT_RC ]; THEN
	echo "source $SCRIPT_RC" >> ~/.bashrc
fi
#touch $SCRIPT_RC
#echo 'export PATH="$HOME/scripts:$PATH"' >> $SCRIPT_RC

## SET DEFAULT ENV VARS

#### Allow Docker on WSL
#echo 'export DOCKER_HOST="tcp://localhost:2375"' >> $SCRIPT_RC

# SETUP WINDOWS PROGRAMS #
# ngrok #
# code editor? #

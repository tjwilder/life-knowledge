#!/bin/bash

# CONSTANTS
BASE_SCRIPTS_DIR="$HOME/scripts"
DOCKER_SCRIPTS_DIR="${BASE_SCRIPTS_DIR}/docker"
GIT_SCRIPTS_DIR="${BASE_SCRIPTS_DIR}/git"
GENERAL_SCRIPTS_DIR="${BASE_SCRIPTS_DIR}/general"

SCRIPT_RC="${BASE_SCRIPTS_DIR}/.scriptrc"

# SETUP LINUX STUFF

## INSTALL SCRIPTS

### Create Script Directories
mkdir -p $BASE_SCRIPTS_DIR
mkdir -p $DOCKER_SCRIPTS_DIR
mkdir -p $GIT_SCRIPTS_DIR
mkdir -p $GENERAL_SCRIPTS_DIR

### COPY SCRIPTS

#### Docker & Docker-Compose Scripts
cp -rn ./scripts/docker/ $DOCKER_SCRIPTS_DIR

#### Git Scripts
cp -rn ./scripts/git/ $GIT_SCRIPTS_DIR

### General Scripts
cp -rn ./scripts/general/ $GENERAL_SCRIPTS_DIR

### UPDATE PATH
if ! grep -Fq $SCRIPT_RC ~/.bashrc; then
	# On Linux startup
	echo "source $SCRIPT_RC" >> ~/.bashrc
	# On Mac startup
	echo "source $SCRIPT_RC" >> ~/.bash_profile
	mkdir -r $SCIPT_RC
	# Exports by expanding BASE_SCRIPTS_DIR but not $PATH
	echo "export PATH=\"$BASE_SCRIPTS_DIR"':$PATH"' >> $SCRIPT_RC
	# If we're in WSL, we also need to fix Docker
	if [-e /proc/version && grep -q Microsoft /proc/version]; then
		echo 'export DOCKER_HOST="tcp://localhost:2375"' >> $SCRIPT_RC
	fi
fi

## SET DEFAULT ENV VARS

# SETUP WINDOWS PROGRAMS #
# ngrok #
# code editor? #
# lice cap # For capturing gifs

## Config Files
tput setaf 6; echo 'Setting configuration settings'; tput sgr0
### Vim
# TODO: Fix these for Windows
# Hard link to main .vimrc
ln ./config/.vimrc ~/
# Soft link to the config/.vim directory
ln -s $PWD/.vim ~/

# Soft link for general config
ln -s ./config/.config ~/

### Tmux
cp -rn ./config/tmux/ ~/
##### Install TPM
if [ ! -d "~/.tmux/plugins/tpm" ]; then
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

### Git
cp -rn ./config/git/ ~/
#### Git Completion in bash
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
# $_ is the last argument to the previous command (in this case, the `test` command)
# On Linux startup
echo "test -f ~/.git-completion.bash && . $_" >> ~/.bashrc
# On Mac startup
echo "test -f ~/.git-completion.bash && . $_" >> ~/.bash_profile


## WSL (Windows Subsystem for Linux) Stuff
if [-e /proc/version && grep -q Microsoft /proc/version]; then
	tput setaf 6; echo 'Initializing WSL settings...'; tput sgr0
	### Fix WSL using /mnt/c instead of /c
	tput setaf 7
	echo 'Fixing Docker mounting requires manual intervention'
	echo 'Copy the following 6 lines into ~/.bashrc and fill in the password'
	echo 'You can also do this manually when you open WSL if you prefer not to have your password in plaintext'
	tput sgr0
	echo
	echo "# Create the /c directory if it doesn't exist"
	echo 'mkdir -p /c'
	echo "# bind mount the default /mnt/c onto just /c"
	echo "echo 'YOUR_PASSWORD_HERE' | sudo -S -p ' ' mount --bind /mnt/c /c"
	echo 'cd ${PWD#/mnt}'
	echo 'echo # for formatting'
	echo ''

	#### Fix docker mounting config with powershell script
	#### Auto-fix outside of WSL if possible
fi

## Detect operating systems
if [ "$(uname)" == "Darwin" ]; then
    # Do something under Mac OS X platform
	echo "Mac OS X"
	./brewing.sh
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Do something under GNU/Linux platform
	echo "GNU/Linux"
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    # Do something under 32 bits Windows NT platform
	echo "MINGW32_NT"
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
    # Do something under 64 bits Windows NT platform
	echo "MINGW64_NT"
else
	echo "Unknown operating system..."
fi

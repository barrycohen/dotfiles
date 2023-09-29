#!/bin/bash

# Intended to be run with
# curl https://raw.githubusercontent.com/barrycohen/dotfiles/master/Sync/config-init.sh | bash

git clone --bare https://github.com/barrycohen/dotfiles.git $HOME/.cfg

# Define config alias locally since the dotfiles
# aren't installed on the system yet
function config {
   git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}

config checkout
config config status.showUntrackedFiles no

#!/bin/sh
set -e

curl -sfL https://direnv.net/install.sh | bash

# if bashrc exists, add direnv hook to it
if [ -f $_REMOTE_USER_HOME/.bashrc ]; then
    echo '\neval "$(direnv hook bash)"' >> $_REMOTE_USER_HOME/.bashrc
fi

if [ -f $_REMOTE_USER_HOME/.zshrc ]; then
    echo '\neval "$(direnv hook zsh)"' >> $_REMOTE_USER_HOME/.zshrc
fi

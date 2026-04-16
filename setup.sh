#!/bin/bash

set -e

ALIASES_URL="https://raw.githubusercontent.com/rockberpro/docker-lda/main/docker-lda.sh"
INSTALL_PATH="$HOME/.docker-lda.sh"

HELP_URL="https://raw.githubusercontent.com/rockberpro/docker-lda/main/docker-lda-help.sh"
HELP_PATH="$HOME/.docker-lda-help.sh"

curl -sL "$ALIASES_URL" -o "$INSTALL_PATH"

BASHRC="${BASHRC:-$HOME/.bashrc}"

if ! grep -qF "source $INSTALL_PATH" "$BASHRC" 2>/dev/null; then
    echo "" >> "$BASHRC"
    echo "source $INSTALL_PATH" >> "$BASHRC"
fi

curl -sL "$HELP_URL" -o "$HELP_PATH"
chmod +x "$HELP_PATH"

echo "docker-lda installed: $INSTALL_PATH"
echo "docker-lda help installed: $HELP_PATH"
echo "Run 'source ~/.bashrc' or open a new terminal to activate."

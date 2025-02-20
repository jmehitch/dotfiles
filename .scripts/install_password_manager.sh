#!/bin/sh

set -e

# exit immediately if bitwarden-cli is already in $PATH
type bw >/dev/null 2>&1 && exit

eval "$(~/.local/bin/mise activate bash)"
mise use -g node
mise use -g npm:@bitwarden/cli

#!/bin/sh

set -ex

# exit immediately if bitwarden-cli is already in $PATH
type bw >/dev/null 2>&1 && exit

mise use -g node
mise use -g npm:@bitwarden/cli

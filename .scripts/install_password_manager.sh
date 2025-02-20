#!/bin/sh

# exit immediately if bitwarden-cli is already in $PATH
type bw >/dev/null 2>&1 && exit

# commands to install bitwarden-cli on Darwin or Linu
case "$(uname -s)" in
Darwin)
    mise use -g npm:@bitwarden/cli
    ;;
Linux)
    mise use -g npm:@bitwarden/cli
    ;;
*)
    echo "unsupported OS"
    exit 1
    ;;
esac

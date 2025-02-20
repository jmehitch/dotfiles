#!/bin/bash

# Check if already logged in
if ! bw login --check > /dev/null 2>&1; then
    bw config server https://vault.bitwarden.eu
    bw login
fi

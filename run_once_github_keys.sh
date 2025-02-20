#!/bin/bash

gh auth login -h github.com -s admin:public_key -s write:gpg_key

bw get item ssh-key | jq -r '.sshKey.publicKey' > ~/.ssh/github.pub
bw get item ssh-key | jq -r '.sshKey.privateKey' > ~/.ssh/github
gh ssh-key add -t "$(hostname)" ~/.ssh/github.pub

bw get notes github-gpg-key > private.key
gpg --import private.key
rm private.key
gpg --armor --export $(gpg --list-secret-keys --keyid-format LONG | grep sec | awk '{print $2}' | cut -d'/' -f2) > public.gpg
gh gpg-key add -t "$(hostname)" public.gpg
rm public.gpg

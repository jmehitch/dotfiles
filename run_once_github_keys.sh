#!/bin/bash

gh auth login -h github.com -s admin:public_key -s write:gpg_key

bw get item ssh-key | jq -r '.sshKey.publicKey' > ~/.ssh/id_ed25519.pub
bw get item ssh-key | jq -r '.sshKey.privateKey' > ~/.ssh/id_ed25519
chmod 600 ~/.ssh/id_ed25519
gh ssh-key add -t jamie ~/.ssh/id_ed25519.pub

bw get notes github-gpg-key > private.key
gpg --import private.key
rm private.key
gpg --armor --export $(gpg --list-secret-keys --keyid-format LONG | grep sec | awk '{print $2}' | cut -d'/' -f2) > public.gpg
if $(gh gpg-key list | grep $(gpg --list-secret-keys --keyid-format LONG | grep sec | awk '{print $2}' | cut -d'/' -f2) | wc -l) -eq 0; then
    gh gpg-key add -t jamie public.gpg
fi
rm public.gpg

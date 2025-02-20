#!/bin/sh

git -C .local/share/chezmoi add .
git -C .local/share/chezmoi commit -m "post-apply hook"
git -C .local/share/chezmoi push

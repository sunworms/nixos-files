#!/usr/bin/env bash

nix-shell -p stow --run '
mkdir -p ~/.config/{helix,fish,git,kitty,niri,noctalia,qt5ct,qt6ct}
mkdir -p ~/.icons/default
stow --target=$HOME/.config config
stow --target=$HOME home-files
'

#!/usr/bin/env bash

export CURRENT_NIX_ENVIRONMENT=$1
export NIXPKGS_ALLOW_UNFREE=1
nix develop --impure $HOME/flakes/shells/$1/ -c zsh 

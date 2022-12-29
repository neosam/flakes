#!/usr/bin/env bash

export CURRENT_NIX_ENVIRONMENT=$1
nix develop $HOME/flakes/shells/$1/ -c zsh

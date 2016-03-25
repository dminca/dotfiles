#!/usr/bin/env bats
source "vars.env"

@test "Check if dotfiles are sucessfully pulled" {
  run $SCRIPT installDotfiles
  run bash -c "test -e $HOME/.bashrc"
  [ $status -eq 0 ]
}
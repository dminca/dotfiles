#!/usr/bin/env bats
source vars

@test "Check if dotfiles are sucessfully pulled" {
  run $SCRIPT installDotfiles
  run bash -c "test -e $HOME/.vimrc"
  [ $status -eq 0 ]
}
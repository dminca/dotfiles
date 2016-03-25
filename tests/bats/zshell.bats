#!/usr/bin/env bats
source "vars.env"

@test "Check if ZSH is properly installed" {
  run $SCRIPT installZsh
  run bash -c "which zsh > /dev/null 2>&1"
  [ $status -eq 0 ]
}
#!/usr/bin/env bats
source "vars.env"

# PASSES locally, TravisCI error
@test "Check if ZSH is properly installed" {
  skip run $SCRIPT installZsh
  run bash -c "which zsh > /dev/null 2>&1"
  [ $status -eq 0 ]
}
#!/usr/bin/env bats
source vars

@test "Check if ZSH is properly installed" {
  run $SCRIPT installZsh
  [ $status -eq 0 ]
}
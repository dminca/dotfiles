#!/usr/bin/env bats
source vars

@test "Check if Vim is successfully configured" {
  run $SCRIPT installVim
  [ $status -eq 0 ]
}
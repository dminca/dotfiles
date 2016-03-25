#!/usr/bin/env bats
source "vars.env"

@test "Check if Vim is successfully configured" {
  run $SCRIPT installVim
  run bash -c "test -d $VIM_PATH > /dev/null 2>&1"
  [ $status -eq 0 ]
}
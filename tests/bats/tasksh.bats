#!/usr/bin/env bats
source "vars.env"

@test "Check if tasksh is successfully installed" {
  run $SCRIPT installTask
  run bash -c "which tasksh > /dev/null 2>&1"
  [ $status -eq 0 ]
}
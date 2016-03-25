#!/usr/bin/env bats
source "vars.env"

@test "Check if tasksh is successfully installed" {
  run $SCRIPT installTask
  [ $status -eq 0 ]
}
#!/usr/bin/env bats
source "vars.env"

# cmake error; labeled as wontfix
@test "Check if tasksh is successfully installed" {
  skip run $SCRIPT installTask
  run bash -c "which tasksh > /dev/null 2>&1"
  [ $status -eq 0 ]
}
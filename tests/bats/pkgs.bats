#!/usr/bin/env bats
source "vars.env"

@test "Check if packages are installed via installPkgs" {
  run $SCRIPT installPkgs
  [ $status -eq 0 ]
}
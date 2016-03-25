#!/usr/bin/env bats
source "vars.env"

@test "Check if packages are installed via installPkgs" {
  skip # WARNING: takes too much. Only test locally
  run $SCRIPT installPkgs
  [ $status -eq 0 ]
}
#!/usr/bin/env bats
source vars

@test "Check if Adobe is installed" {
  run $SCRIPT installAdobe
  [ $status -eq 0 ]
}
#!/usr/bin/env bats
source "vars.env"

@test "Check if installation junk is cleared" {
  run $SCRIPT clearInstall
  [ $status -eq 0 ]
}
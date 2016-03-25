#!/usr/bin/env bats
source "vars.env"

@test "Check if Numix theme is properly installed" {
  run $SCRIPT themeNumix
  [ $status -eq 0 ]
}
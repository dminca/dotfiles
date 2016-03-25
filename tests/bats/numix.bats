#!/usr/bin/env bats
source "vars.env"

@test "Check if Numix theme is properly installed" {
  run $SCRIPT themeNumix
  run bash -c "apt-cache show numix-icon-theme > /dev/null 2>&1"
  [ $status -eq 0 ]
}
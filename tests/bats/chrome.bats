#!/usr/bin/env bats
source vars

@test "Check if Chrome is properly installed" {
  run $SCRIPT installChrome
  run bash -c "apt-cache show google-chrome-stable > /dev/null 2>&1"
  [ $status -eq 0 ]
}
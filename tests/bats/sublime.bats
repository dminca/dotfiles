#!/usr/bin/env bats
source "vars.env"

@test "Check if SublimeText is properly installed" {
  run $SCRIPT installSublime
  run bash -c "subl --version > /dev/null 2>&1"
  [ $status -eq 0 ]
}
#!/usr/bin/env bats
source vars

@test "Check if SublimeText is properly installed" {
  run $SCRIPT installSublime
  [ $status -eq 0 ]
}
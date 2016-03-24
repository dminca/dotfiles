#!/usr/bin/env bats
source vars

@test "Check if the Paper theme is properly installed" {
  run $SCRIPT themePaper
  [ $status -eq 0 ]
}
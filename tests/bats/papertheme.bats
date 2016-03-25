#!/usr/bin/env bats
source "vars.env"

@test "Check if the Paper theme is properly installed" {
  run $SCRIPT themePaper
  [ $status -eq 0 ]
}
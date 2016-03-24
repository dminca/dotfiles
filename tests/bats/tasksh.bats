#!/usr/bin/env bats
source vars

@test "Check if tasksh is successfully installed" {
  run $SCRIPT installTask
  [ $status -eq 0 ]
}
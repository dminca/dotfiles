#!/usr/bin/env bats
source "vars.env"

@test "Check if the memory cleanup if done properly" {
  run $SCRIPT cleanup_memory
  [ $status -eq 0 ]
}
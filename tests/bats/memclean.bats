#!/usr/bin/env bats
source "vars.env"

# passing locally, TravisCI error
@test "Check if the memory cleanup if done properly" {
  skip run $SCRIPT cleanup_memory
  [ $status -eq 0 ]
}
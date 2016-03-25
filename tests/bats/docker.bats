#!/usr/bin/env bats
source "vars.env"

@test "Check if Docker is installed properly" {
  run $SCRIPT installDocker
  run bash -c "docker --version > /dev/null 2>&1"
  [ $status -eq 0 ]
}
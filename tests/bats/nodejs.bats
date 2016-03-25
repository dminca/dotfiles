#!/usr/bin/env bats
source "vars.env"

@test "Check if NodeJS is installed properly" {
  run $SCRIPT installNode
  run bash -c "nodejs --version > /dev/null 2>&1"
  [ $status -eq 0 ]
}
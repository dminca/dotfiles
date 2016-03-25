#!/usr/bin/env bats
source "vars.env"

@test "Check if NodeJS is installed properly" {
  run $SCRIPT installNode
  [ $status -eq 0 ]
}
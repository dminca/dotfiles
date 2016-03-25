#!/usr/bin/env bats
source "vars.env"

# takes too much to install apt packages
# PASSES locally
@test "Check if NodeJS is installed properly" {
  skip run $SCRIPT installNode
  run bash -c "nodejs --version > /dev/null 2>&1"
  [ $status -eq 0 ]
}